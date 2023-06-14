const jwt = require('jsonwebtoken');

const isLogin = (req, res, next) => {
  const token = req.header('x-auth-token');

  if (!token) {
    return res.status(401).json({ error: 'Unauthorized' });
  }

  try {
    const decoded = jwt.verify(token, 'PROYEKWS');

    // Setel pengguna yang terautentikasi ke dalam objek request
    req.user = decoded;

    // Lanjutkan ke middleware atau handler berikutnya
    next();
  } catch (error) {
    console.error(error);
    return res.status(401).json({ error: 'Invalid token' });
  }
};

module.exports = isLogin;
