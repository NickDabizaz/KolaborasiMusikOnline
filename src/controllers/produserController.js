const { User } = require("../models");

const registerProduser = async (req, res) => {
  let { user_id } = req.params;
  user_id = user_id.toString().toUpperCase();

  try {
    const result = await User.update(
      { role: "produser" }, // Peran baru yang akan diupdate
      { where: { user_id } } // Kondisi untuk menemukan pengguna yang akan diupdate
    );

    if (!result) {
      return res.status(404).json({ error: "User not found" });
    }

    return res.json({ message: "Berhasil mendaftar sebagai produser" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Terjadi kesalahan server" });
  }
};

const createProject = async (req, res) => {
  // Implementasi logika untuk membuat postingan proyek musik baru
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
