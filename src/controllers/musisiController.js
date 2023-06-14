const { User } = require("../models");

const registerMusisi = async (req, res) => {
  let { user_id } = req.params;
  user_id = user_id.toString().toUpperCase();

  try {
    const result = await User.update(
      { role: 'musisi' }, // Peran baru yang akan diupdate
      { where: { user_id } } // Kondisi untuk menemukan pengguna yang akan diupdate
    );

    if (result[0] === 0) {
      return res.status(404).json({ error: 'User not found' });
    }

    return res.json({ message: 'Berhasil mendaftar sebagai musisi' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: 'Terjadi kesalahan server' });
  }
};


const uploadRecording = async (req, res) => {
  // Implementasi logika untuk mengupload rekaman musik atau video
};

module.exports = {
  registerMusisi,
  uploadRecording,
};
