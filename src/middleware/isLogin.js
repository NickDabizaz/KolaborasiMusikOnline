const jwt = require("jsonwebtoken");
const { User } = require("../models");

const isLogin = async (req, res, next) => {
  const token = req.header("x-auth-token");

  if (!token) {
    return res.status(400).send("Authentication token is missing");
  }

  try {
    const decoded = jwt.verify(token, "PROYEKWS");

    let user = await User.findOne({ where: { user_id: decoded.user_id } });
    // Setel pengguna yang terautentikasi ke dalam objek request
    req.user = user;

    // Lanjutkan ke middleware atau handler berikutnya
    next();
  } catch (error) {
    console.error(error);
    return res.status(401).json({ error: "Invalid token" });
  }
};

module.exports = isLogin;
