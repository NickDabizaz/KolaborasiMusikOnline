const { User } = require("../models");
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
  let { title, description } = req.body;
  let producer_id = req.user.user_id;

  if (!title || !description || !producer_id) {
    return res.status(400).json({ error: "All fields are required" });
  }

  let projectamount = await Project.findAll();
  let newID = `P${(projectamount.length + 1).toString().padStart(3, '0')}`

  const currentDate = new Date();

  let createproject = await Project.create({
    project_id : newID,
    title,
    description,
    poster_path : null,
    producer_id,
    createdAt: currentDate,
    updatedAt: currentDate,
  });

  return res.status(201).send({
    message: "Project registered successfully",
    project_id : newID,
    title,
    description,
    poster_path : null,
    producer_id,
    createdAt: currentDate,
    updatedAt: currentDate,
  });
};

const searchMusisi = async (req, res) => {
  // Implementasi logika untuk mencari musisi untuk proyek
};

const inviteMusisi = async (req, res) => {
  // Implementasi logika untuk mengundang musisi untuk proyek
};

const deleteProjectPost = async (req, res) => {
  // Implementasi logika untuk menghapus postingan proyek musik
};

module.exports = {
  registerProduser,
  createProject,
  searchMusisi,
  inviteMusisi,
  deleteProjectPost,
};
