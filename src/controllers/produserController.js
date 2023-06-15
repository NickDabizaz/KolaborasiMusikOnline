const { Op } = require("sequelize");
const { User, ProjectMember } = require("../models");
const { Project } = require("../models");

const registerProduser = async (req, res) => {
  let { user_id } = req.params;
  user_id = user_id.toString().toUpperCase();

  try {
    const result = await User.update(
      { role: "produser" }, // Peran baru yang akan diupdate
      { where: { user_id } } // Kondisi untuk menemukan pengguna yang akan diupdate
    );

    if (result[0] === 0) {
      return res.status(404).json({ error: "User not found" });
    }

    return res.json({ message: "Berhasil mendaftar sebagai produser" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Terjadi kesalahan server" });
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
      poster_path: null,
      producer_id,
      createdAt: currentDate,
      updatedAt: currentDate,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};


const searchMusisi = async (req, res) => {
  // Implementasi logika untuk mencari musisi untuk proyek
};

const inviteMusisi = async (req, res) => {
  const { project_id, user_id } = req.body;

  try {
    const project = await Project.findOne({
      where: { project_id },
    });

    if (!project) {
      return res.status(404).json({ error: 'Project not found' });
    }

    const user = await User.findOne({
      where: { user_id },
    });

    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }

    if (user.role !== 'musisi') {
      return res.status(400).json({ error: 'The user is not a musician' });
    }

    const lastProjectMember = await ProjectMember.findOne({
      order: [['project_member_id', 'DESC']],
    });

    let newId = 'M001'; // Default ID jika belum ada entri dalam tabel

    if (lastProjectMember) {
      const lastId = lastProjectMember.project_member_id;
      const lastNumericPart = parseInt(lastId.substring(1));
      const newNumericPart = (lastNumericPart + 1).toString().padStart(3, '0');
      newId = 'M' + newNumericPart;
    }

    await ProjectMember.create({
      project_member_id: newId,
      project_id,
      musician_id: user_id,
    });

    return res.json({ message: 'The musician has been successfully invited to the project' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: 'Internal Server Error' });
  }
};


const deleteProjectPost = async (req, res) => {
  const { project_id } = req.params;

  try {
    const deletedProject = await Project.destroy({
      where: { project_id: project_id },
    });

    if (deletedProject === 0) {
      return res.status(404).json({ error: 'Project not found' });
    }

    return res.json({ message: 'Project post successfully deleted' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: 'Internal server error' });
  }
};

const searchProject = async (req, res) => {
  const { q, page, limit, sort } = req.query;
  const pageNumber = parseInt(page) || 1;
  const pageSize = parseInt(limit) || 10;
  const sortBy = sort || 'createdAt';

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
      order: [[sortBy, 'ASC']],
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
    return res.status(500).json({ error: 'Terjadi kesalahan server' });
  }
};


module.exports = {
  registerProduser,
  createProject,
  searchMusisi,
  inviteMusisi,
  deleteProjectPost,
  searchProject
};
