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
  getComments
} = require("../controllers/userController");

const isLogin = require("../middleware/isLogin");
const checkRole = require("../middleware/checkRole");

router.post("/register", registerUser);
router.post("/login", loginUser);
router.get("/listen/:recording_id", listenToMusic);
router.post("/comment/:project_id", [isLogin], giveComment);
router.delete(
  "/comment/:comment_id",
  [isLogin, checkRole("musisi", "produser")],
  deleteComment
);
router.get('/comment', getComments)
router.get('/comment/:user_id',[isLogin], getDetailComment)
router.put("/topup/:user_id", [isLogin], topUp);
router.put("/recharge/:user_id", [isLogin], recharge);

module.exports = router;
