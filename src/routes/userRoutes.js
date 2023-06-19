const express = require("express");
const router = express.Router();

// Import user controller
const {
  registerUser,
  loginUser,
  listenToMusic,
  giveComment,
  deleteComment,
  topUp,
  recharge,
  getComments,
  getUserComment,
} = require("../controllers/userController");

const isLogin = require("../middleware/isLogin");
const hitReduce = require("../middleware/hitReduce");
const checkRole = require("../middleware/checkRole");

router.post("/register", registerUser);
router.post("/login", loginUser);
router.get("/listen/:recording_id", [isLogin, hitReduce], listenToMusic);
router.post("/comment/:project_id", [isLogin, hitReduce], giveComment);
router.delete("/comment/:comment_id", [isLogin, hitReduce], deleteComment);
router.get("/comment", getComments);
router.get("/comment/:user_id", [isLogin, hitReduce], getUserComment);
router.put("/topup/:user_id", [isLogin], topUp);
router.put("/recharge/:user_id", [isLogin], recharge);

module.exports = router;
