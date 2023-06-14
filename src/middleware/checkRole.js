const checkRole = (...roles) => {
  return (req, res, next) => {
    const { role } = req.user;

    if (!roles.includes(role)) {
      return res.status(403).json({ error: 'Unauthorized' });
    }

    next();
  };
};

module.exports = checkRole;
