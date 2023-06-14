const checkRole = (...roles) => {
  return (req, res, next) => {
      next();
  };
};

module.exports = checkRole;
