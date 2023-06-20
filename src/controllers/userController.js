const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { User, Project, Comment, Recording } = require("../models");
const Joi = require("joi");
const { Op } = require("sequelize");

const checkUniqueUsername = async (username) => {
  let isExist = "";

  isExist = await User.findOne({
    attributes: ["username"],
    where: {
      username: {
        [Op.like]: username,
      },
    },
  });
  if (isExist) {
    throw new Error("Username already registered");
  }
};

const registerUser = async (req, res) => {
  try {
    // Mendapatkan data yang dikirim dari request body
    const schema = Joi.object({
      username: Joi.string()
        .min(4)
        .max(20)
        .external(checkUniqueUsername)
        .required()
        .messages({
          "any.required": "Username is required",
          "string.min": "Username must be at least 4 characters long",
          "string.max": "Username must not exceed 20 characters",
        }),

      name: Joi.string().min(4).max(50).required().messages({
        "any.required": "Name is required",
        "string.min": "Name must be at least 4 characters long",
        "string.max": "Name must not exceed 50 characters",
      }),

      password: Joi.string()
        .min(4)
        .max(20)
        .pattern(
          /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]+$/
        )
        .required()
        .messages({
          "any.required": "Password is required",
          "string.min": "Password must be at least 4 characters long",
          "string.max": "Password must not exceed 20 characters",
          "string.pattern.base":
            "Password must contain at least 1 lowercase letter, 1 uppercase letter, 1 number, and 1 symbol",
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

    try {
      await schema.validateAsync(req.body);
    } catch (error) {
      return res.status(400).send(error.message.toString());
    }

    let user = {
      ...req.body,
    };

    const maxId = await User.max("user_id");
    const urutan = maxId ? Number(maxId.substr(3, 3)) + 1 : 1;
    const user_id = `UID${urutan.toString().padStart(3, "0")}`;

    // Mengenkripsi password sebelum disimpan ke database
    const hashedPassword = await bcrypt.hash(user.password, 10);

    // Membuat tanggal dan waktu saat ini
    const currentDate = new Date();

    // Menambahkan data user ke dalam tabel Users
    await User.create({
      user_id,
      username: user.username,
      name: user.name,
      password: hashedPassword,
      email: user.email,
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
        username: user.username,
        name: user.username,
        email: user.email,
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
    username: Joi.string().min(4).max(20).required().messages({
      "any.required": "Username is required",
      "string.empty": "Username is required",
      "string.min": "Username must be at least 4 characters long",
      "string.max": "Username must not exceed 20 characters",
    }),
    password: Joi.string().required().messages({
      "any.required": "Password is required",
      "string.empty": "Password is required",
    }),
  });

  try {
    const validation = schema.validate(req.body, { abortEarly: false });

    if (validation.error) {
      const errors = validation.error.details.map((err) => err.message);
      return res.status(400).json({ errors });
    }

    const user = await User.findOne({ where: { username } });

    if (!user) {
      return res
        .status(401)
        .json({ error: "Username or password is incorrect" });
    }

    const isPasswordValid = await bcrypt.compare(password, user.password);

    if (!isPasswordValid) {
      return res
        .status(401)
        .json({ error: "Username or password is incorrect" });
    }

    const token = jwt.sign(
      { user_id: user.user_id, username: user.username },
      "PROYEKWS",
      { expiresIn: "3600s" }
    );

    return res.json({ message: "Login success", token });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const listenToMusic = async (req, res) => {
  const { recording_id } = req.params;

  try {
    const recording = await Recording.findOne({
      where: { recording_id },
      attributes: ["title", "song_url"],
    });

    if (!recording) {
      return res.status(404).json({ error: "Recording not found" });
    }

    return res.json({
      title: recording.title,
      url: recording.song_url,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const giveComment = async (req, res) => {
  try {
    const { project_id } = req.params;

    const project = await Project.findOne({ where: { project_id } });
    if (!project) {
      return res.status(404).json({ error: "Project not found" });
    }

    const { comment } = req.body;
    if (!comment) {
      return res.status(400).json({ error: "Comment cannot be blank" });
    }

    if (!req.user || !req.user.user_id) {
      return res.status(400).json({ error: "User ID not provided" });
    }

    const maxId = await Comment.max("comment_id");
    const sequenceNumber = maxId ? Number(maxId.substr(1, 3)) + 1 : 1;
    const comment_id = `C${sequenceNumber.toString().padStart(3, "0")}`;
    await Comment.create({
      comment_id,
      project_id,
      commenter_id: req.user.user_id,
      comment,
    });

    return res.status(200).json({ message: "Comment posted successfully" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "An internal server error occurred" });
  }
};


const deleteComment = async (req, res) => {
  try {
    let token = req.header("x-auth-token");
    if (!token) {
      return res.status(400).send("Authentication token is missing");
    }

    let { comment_id } = req.params;

    let comment = await Comment.findOne({ where: { comment_id } });
    if (!comment) return res.status(404).send("Comment not found");

    let userData = jwt.verify(token, "PROYEKWS");

    console.log(userData);
    if (comment.commenter_id != userData.user_id)
      return res.status(401).send("Cannot delete another user comment!");

    try {
      userData = jwt.verify(token, "PROYEKWS");
    } catch (err) {
      return res.status(400).send("Invalid JWT Key");
    }

    let temp = await Comment.destroy({ where: { comment_id } });

    return res.status(200).send("Successfully deleted comment!");
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const topUp = async (req, res) => {
  // Implementasi logika untuk top up
  try {
    let token = req.header("x-auth-token");
    if (!token) {
      return res.status(400).send("Authentication token is missing");
    }

    let { amount } = req.body;
    if (!amount) return res.status(400).send("Amount is required!");

    let userData;

    try {
      userData = jwt.verify(token, "PROYEKWS");
    } catch (err) {
      return res.status(400).send("Invalid JWT Key");
    }

    let user = await User.findOne({ where: { username: userData.username } });

    let curBalance = user.balance;

    newBalance = Number(curBalance) + Number(amount);

    let topup = User.update(
      { balance: newBalance },
      { where: { username: userData.username } }
    );

    return res.status(200).send({ message: "Top-up successful" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const recharge = async (req, res) => {
  // Implementasi logika untuk recharge
  try {
    let token = req.header("x-auth-token");
    if (!req.header("x-auth-token")) {
      return res.status(400).send("Authentication token is missing");
    }
    let userData;

    try {
      userData = jwt.verify(token, "PROYEKWS");
    } catch (err) {
      return res.status(400).send("Invalid JWT Key");
    }

    let user = await User.findOne({ where: { username: userData.username } });

    let curBalance = user.balance;
    let newBalance = Number(curBalance) - 5000;

    if (newBalance < 0) return res.status(402).send("Insufficent balance");

    let curApi_hit = user.api_hit;
    let newApi_hit = Number(curApi_hit) + 200;

    let temp = User.update(
      { balance: newBalance, api_hit: newApi_hit },
      { where: { username: userData.username } }
    );

    return res.status(200).json({message : "Recharge successful"});
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const getComments = async (req, res) => {
  const { keyword } = req.query;

  try {
    let comments;

    if (keyword) {
      comments = await Comment.findAll({
        where: {
          comment: {
            [Op.like]: `%${keyword}%`,
          },
        },
        include: [
          { model: Project, as: "project", attributes: ["title"] },
          { model: User, as: "commenter", attributes: ["name"] },
        ],
        attributes: ["comment_id", "comment"],
      });
    } else {
      comments = await Comment.findAll({
        include: [
          { model: Project, as: "project", attributes: ["title"] },
          { model: User, as: "commenter", attributes: ["name"] },
        ],
        attributes: ["comment_id", "comment"],
      });
    }

    const formattedComments = comments.map((comment) => ({
      comment_id: comment.comment_id,
      project_id: comment.project.title,
      commenter_id: comment.commenter.name,
      comment: comment.comment,
    }));

    return res.json({ comments: formattedComments });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const getUserComment = async (req, res) => {
  try {
    user_id = req.user.user_id
    console.log(user_id);

    const comments = await Comment.findAll({
      where: { commenter_id: user_id },
      include: [
        {
          model: User,
          as: "commenter",
          attributes: ["name"],
        },
        {
          model: Project,
          as: "project",
          attributes: ["title"],
        },
      ],
    });

    console.log({comments});

    const formattedComments = comments.map((comment) => ({
      comment_id: comment.comment_id,
      project_title: comment.project.title,
      comment: comment.comment,
    }));

    return res.status(200).json({ comments: formattedComments });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "An internal server error occurred" });
  }
};

module.exports = {
  registerUser,
  loginUser,
  listenToMusic,
  giveComment,
  deleteComment,
  topUp,
  recharge,
  getComments,
  getUserComment,
};
