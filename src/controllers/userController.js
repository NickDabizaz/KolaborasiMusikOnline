const bcrypt = require("bcrypt");
const { User } = require("../models");

const registerUser = async (req, res) => {
  try {
    // Mendapatkan data yang dikirim dari request body
    const { username, name, password, confirm_password, email } = req.body;

    // Memeriksa apakah semua field sudah diisi
    if (!username || !name || !password || !confirm_password || !email) {
      return res.status(400).json({ error: "All fields are required" });
    }

    // Memeriksa apakah password dan konfirmasi password sama
    if (password !== confirm_password) {
      return res
        .status(400)
        .json({ error: "Password and confirm password do not match" });
    }

    // Memeriksa apakah email memiliki format yang valid
    if (!email.includes("@") || !email.includes(".")) {
      return res.status(400).json({ error: "Invalid email format" });
    }

    // Memeriksa apakah username sudah digunakan
    const existingUser = await User.findOne({ where: { username } });
    if (existingUser) {
      return res.status(400).json({ error: "Username already exists" });
    }

    const maxId = await User.max("user_id");
    const urutan = maxId ? Number(maxId.substr(3, 3)) + 1 : 1;
    const user_id = `UID${urutan.toString().padStart(3, "0")}`;

    // Mengenkripsi password sebelum disimpan ke database
    const hashedPassword = await bcrypt.hash(password, 10);

    // Membuat tanggal dan waktu saat ini
    const currentDate = new Date();

    // Menambahkan data user ke dalam tabel Users
    await User.create({
      user_id,
      username,
      name,
      password: hashedPassword,
      email,
      role: "member",
      balance: 0,
      api_hit: 0,
      createdAt: currentDate,
      updatedAt: currentDate,
    });

    return res.status(201).json({
      message: "User registered successfully",
      user: {
        user_id,
        username,
        name,
        email,
        role: "member",
        balance: 0,
        api_hit: 0,
        createdAt: currentDate,
        updatedAt: currentDate,
      },
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};


const loginUser = async (req, res) => {
  // Implementasi logika untuk login user
};

const listenToMusic = async (req, res) => {
  // Implementasi logika untuk mendengarkan musik
};

const giveComment = async (req, res) => {
  // Implementasi logika untuk memberikan komentar atau feedback
};

const deleteComment = async (req, res) => {
  // Implementasi logika untuk menghapus komentar atau feedback
};

const topUp = async (req, res) => {
  // Implementasi logika untuk top up
};

const recharge = async (req, res) => {
  // Implementasi logika untuk recharge
};

module.exports = {
  registerUser,
  loginUser,
  listenToMusic,
  giveComment,
  deleteComment,
  topUp,
  recharge,
};
