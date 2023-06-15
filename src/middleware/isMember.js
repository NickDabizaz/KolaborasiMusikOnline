const isMember = (req, res, next) => {
    const user = req.user;
  
    if (user.role !== 'member') {
      return res.status(403).json({ error: 'Access denied. User role must be member' });
    }
  
    next();
  };
  
  module.exports = isMember;
  