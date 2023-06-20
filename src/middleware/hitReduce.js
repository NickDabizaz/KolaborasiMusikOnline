const jwt = require("jsonwebtoken");
const { User } = require("../models");

const hitReduce = async (req, res, next) => {
  const token = req.header("x-auth-token");

  if (!token) {
    return res.status(400).send("Authentication token is missing");
  }

  try {
    const decoded = jwt.verify(token, "PROYEKWS");
    console.log({decoded});

    let curApi_hit = await User.findOne({
      attributes: ["api_hit"],
      where: { username: decoded.username },
    });

    let newApi_hit = curApi_hit.api_hit - 1;
    if (newApi_hit < 0) return res.status(402).send("Insufficent api_hit");

    await User.update(
      { api_hit: newApi_hit },
      { where: { user_id: decoded.user_id } }
    );

    let user = await User.findByPk(decoded.user_id)
    // Setel pengguna yang terautentikasi ke dalam objek request
    req.user = user;

    // Lanjutkan ke middleware atau handler berikutnya
    next();
  } catch (error) {
    console.error(error);
    return res.status(401).json({ error: "Invalid" });
  }
};

module.exports = hitReduce;
