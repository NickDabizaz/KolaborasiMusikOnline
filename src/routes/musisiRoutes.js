const express = require("express");
const router = express.Router();

// Import musisi controller
const {
  registerMusisi,
  uploadRecording,
  getRecording,
  getDetailRecording,
  updateRecording,
} = require("../controllers/musisiController");

const isLogin = require("../middleware/isLogin");
const checkRole = require("../middleware/checkRole");
const isMember = require("../middleware/isMember");

router.put("/register", [isLogin, isMember], registerMusisi);
router.post("/upload", [isLogin, checkRole("musisi")], uploadRecording);
router.get(
  "/recording",
  [isLogin, checkRole("musisi", "produser")],
  getRecording
);
router.get(
  "/recording/:recording_id",
  [isLogin, checkRole("musisi")],
  getDetailRecording
);
router.put(
  "/recording/:recording_id",
  [isLogin, checkRole("musisi")],
  updateRecording
);

module.exports = router;
