const { Op } = require("sequelize");
const { User, ProjectMember } = require("../models");
const { Project } = require("../models");
const multer = require("multer");
const fs = require("fs"); //filesystem
const path = require("path");

let id = 1;
const storage = multer.diskStorage({
  destination: (req, file, callback) => {
    const { project_id } = req.body;
    const folderName = `poster/${project_id}`;

    if (!fs.existsSync(folderName)) {
      fs.mkdirSync(folderName, { recursive: true });
    }

    callback(null, folderName);
  },
  filename: (req, file, callback) => {
    const fileExtension = path.extname(file.originalname).toLowerCase();

    if (file.fieldname == "poster") {
      callback(null, `poster${fileExtension}`);
    } else if (file.fieldname == "poster[]") {
      callback(null, `${id}${fileExtension}`);
      id++;
    } else {
      callback(null, false);
    }
  },
});

const upload = multer({
  storage: storage,
  // limits: {
  //   fileSize: 50000000, // in bytes, e.g. 1000 = 1kb, 1000000 = 1mb
  // },
  fileFilter: (req, file, callback) => {
    // Specify the allowed extensions using regular expression
    const rules = /jpeg|jpg|png|gif/;

    const fileExtension = path.extname(file.originalname).toLowerCase();
    const fileMimeType = file.mimetype;

    const isExtensionValid = rules.test(fileExtension);
    const isMimeTypeValid = rules.test(fileMimeType);

    if (isExtensionValid && isMimeTypeValid) {
      callback(null, true);
    } else {
      callback(null, false);
      return callback(
        new multer.MulterError(
          "File type must be .gif, .png, .jpg, or .jpeg",
          file.fieldname
        )
      );
    }
  },
});

const registerProduser = async (req, res) => {
  const { user_id } = req.user; // Mengambil user_id dari objek user di dalam req
  const formattedUserId = user_id.toString().toUpperCase();

  try {
    const [updatedCount] = await User.update(
      { role: "produser" }, // Peran baru yang akan diupdate
      { where: { user_id: formattedUserId } } // Kondisi untuk menemukan pengguna yang akan diupdate
    );

    if (updatedCount === 0) {
      return res.status(404).json({ error: "User not found" });
    }

    return res.json({ message: "Successfully registered as a producer" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const createProject = async (req, res) => {
  const { title, description } = req.body;
  const producer_id = req.user.user_id;

  if (!title || !description || !producer_id) {
    return res.status(400).json({ error: "All fields are required" });
  }

  try {
    const lastProject = await Project.findOne({
      order: [["project_id", "DESC"]],
    });

    let lastID = 0;
    if (lastProject) {
      lastID = parseInt(lastProject.project_id.substring(1));
    }

    const newID = `P${(lastID + 1).toString().padStart(3, "0")}`;

    const currentDate = new Date();

    const createProject = await Project.create({
      project_id: newID,
      title,
      description,
      poster_path: null,
      producer_id,
      createdAt: currentDate,
      updatedAt: currentDate,
    });

    return res.status(201).json({
      message: "Project registered successfully",
      project_id: createProject.project_id,
      title,
      description,
      producer_id,
      createdAt: currentDate,
      updatedAt: currentDate,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const inviteMusisi = async (req, res) => {
  const { project_id, user_id } = req.body;

  try {
    const project = await Project.findOne({
      where: { project_id },
    });

    if (!project) {
      return res.status(404).json({ error: "Project not found" });
    }

    const user = await User.findOne({
      where: { user_id },
    });

    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    if (user.role !== "musisi") {
      return res.status(400).json({ error: "The user is not a musician" });
    }

    const lastProjectMember = await ProjectMember.findOne({
      order: [["project_member_id", "DESC"]],
    });

    let newId = "M001"; // Default ID jika belum ada entri dalam tabel

    if (lastProjectMember) {
      const lastId = lastProjectMember.project_member_id;
      const lastNumericPart = parseInt(lastId.substring(1));
      const newNumericPart = (lastNumericPart + 1).toString().padStart(3, "0");
      newId = "M" + newNumericPart;
    }

    await ProjectMember.create({
      project_member_id: newId,
      project_id,
      musician_id: user_id,
    });

    return res.json({
      message: "The musician has been successfully invited to the project",
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal Server Error" });
  }
};

const deleteProjectPost = async (req, res) => {
  const { project_id } = req.params;

  try {
    const deletedProject = await Project.destroy({
      where: { project_id: project_id },
    });

    if (deletedProject === 0) {
      return res.status(404).json({ error: "Project not found" });
    }

    return res.json({ message: "Project post successfully deleted" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const searchProject = async (req, res) => {
  const { q, page, limit, sort } = req.query;
  const pageNumber = parseInt(page) || 1;
  const pageSize = parseInt(limit) || 10;
  const sortBy = sort || "createdAt";

  try {
    let conditions = {};

    if (q) {
      conditions = {
        [Op.or]: [
          { title: { [Op.like]: `%${q}%` } },
          { description: { [Op.like]: `%${q}%` } },
        ],
      };
    }

    const totalCount = await Project.count({ where: conditions });
    const totalPages = Math.ceil(totalCount / pageSize);

    const projects = await Project.findAll({
      where: conditions,
      order: [[sortBy, "ASC"]],
      offset: (pageNumber - 1) * pageSize,
      limit: pageSize,
    });

    return res.json({
      page: pageNumber,
      total_pages: totalPages,
      total_results: totalCount,
      projects,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Terjadi kesalahan server" });
  }
};

const uploadPoster = async (req, res) => {
  try {
    // Implement logic to upload the poster
    await upload.single("poster")(req, res, async (err) => {
      if (err) {
        console.log(err);
        return res
          .status(400)
          .send((err.message || err.code) + " on field " + err.field);
      }

      const { project_id } = req.body;
      if (!project_id) {
        return res.status(400).json({ message: "project_id is required" });
      }
      const project = await Project.findOne({ where: { project_id } });

      if (!project) {
        // Delete the uploaded file
        if (req.file) {
          const filePath = req.file.path;
          fs.unlinkSync(filePath);
        }

        return res.status(404).json({ message: "Project Not Found" });
      }

      return res.status(200).json({ message: "Poster uploaded successfully" });
    });
  } catch (err) {
    console.error(err);
    return res.status(400).send(err.message);
  }
};

const getPoster = (req, res) => {
  const { project_id } = req.params;
  const folderPath = `poster/${project_id}`;

  // Check if the folder exists
  fs.access(folderPath, fs.constants.F_OK, (err) => {
    if (err) {
      // Folder not found, send 404 Not Found response
      console.log(err);
      return res.status(404).json({message : "Poster not found."});
    }

    // Folder found, proceed to send the file
    const filePath = `${folderPath}/poster.jpg`;

    // Check if the file exists
    fs.access(filePath, fs.constants.F_OK, (err) => {
      if (err) {
        // File not found, send 404 Not Found response
        return res.status(404).json({message : "Poster not found."});
      }

      // File found, send the file using sendFile()
      return res.status(200).sendFile(filePath, { root: "." });
    });
  });
};

module.exports = {
  registerProduser,
  createProject,
  inviteMusisi,
  deleteProjectPost,
  searchProject,
  uploadPoster,
  getPoster,
};
