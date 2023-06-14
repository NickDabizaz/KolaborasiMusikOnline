const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { User } = require("../models");
const Joi = require("joi");

const checkExistUsername = async (username) => {
  let isExist = "";

  isExist = await User.findOne({
    attributes: ["username"],
    where: {
      username: {
        [Op.like]: username,
      },
    },
  });
  if (!isExist) {
    throw new Error("user tidak terdaftar");
  }
};

const registerUser = async (req, res) => {
  try {
    // Mendapatkan data yang dikirim dari request body
    const schema = Joi.object({
      username: Joi.string()
        .alphanum()
        .min(4)
        .max(20)
        .external(checkExistUsername)
        .required()
        .messages({
          "any.required": "Username is required",
        }),

      name: Joi.string().min(4).max(50).required().messages({
        "any.required": "Name is required",
      }),

      password: Joi.string().min(4).max(20).required().messages({
        "any.required": "Password is required",
      }),

      confirm_password: Joi.string()
        .min(4)
        .max(20)
        .valid(Joi.ref("password"))
        .required()
        .messages({
          "any.required": "Confirm_password is required",
          "any.only": "Passwords do not match",
        }),

      email: Joi.string().email().required().messages({
        "any.required": "Email is required",
      }),
    });

    let user = {
      ...req.body,
    };

    // Memeriksa apakah semua field sudah diisi
    if (
      !user.username ||
      !user.name ||
      !user.password ||
      !user.confirm_password ||
      !user.email
    ) {
      return res.status(400).json({ error: "All fields are required" });
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
  const { username, password } = req.body;
  const schema = Joi.object({
    username: Joi.string().email().required().messages({
      "any.required": "email_address wajib diisi",
    }),

    password: Joi.string().required().messages({
      "any.required": "Password wajib diisi",
    }),
  });

  try {
    // Cari pengguna berdasarkan username
    const user = await User.findOne({ where: { username } });

    // Jika pengguna tidak ditemukan, kirim pesan error
    if (!user) {
      return res
        .status(401)
        .json({ error: "Username or password is incorrect" });
    }

    // Verifikasi password pengguna
    const isPasswordValid = await bcrypt.compare(password, user.password);

    // Jika password tidak valid, kirim pesan error
    if (!isPasswordValid) {
      return res
        .status(401)
        .json({ error: "Username or password is incorrect" });
    }

    // Buat token JWT dengan payload pengguna
    const token = jwt.sign(
      { user_id: user.user_id, username: user.username },
      "PROYEKWS",
      {
        expiresIn: "3600s", // Durasi token berlaku (opsional)
      }
    );

    // Kirim token sebagai respons
    return res.json({ message: "Login Succes", token });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const listenToMusic = async (req, res) => {
  // Implementasi logika untuk mendengarkan musik
};

const giveComment = async (req, res) => {
  // Implementasi logika untuk memberikan komentar atau feedback
  return res.send('ok')
};

const deleteComment = async (req, res) => {
  // Implementasi logika untuk menghapus komentar atau feedback
  return res.send('ok')
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
