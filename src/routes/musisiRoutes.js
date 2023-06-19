const express = require("express");
const router = express.Router();

// Import musisi controller
const {
  registerMusisi,
  uploadRecording,
  getRecording,
  getDetailRecording,
  updateRecording,
  deleteRecording,
} = require("../controllers/musisiController");

const isLogin = require("../middleware/isLogin");
const hitReduce = require("../middleware/hitReduce");
const checkRole = require("../middleware/checkRole");
const isMember = require("../middleware/isMember");

router.put("/register", [isLogin, isMember], registerMusisi);
router.post(
  "/upload",
  [isLogin, checkRole("musisi"), hitReduce],
  uploadRecording
);
router.get(
  "/recording",
  [isLogin, checkRole("musisi", "produser"), hitReduce],
  getRecording
);
router.get(
  "/recording/:recording_id",
  [isLogin, checkRole("musisi"), hitReduce],
  getDetailRecording
);
router.put(
  "/recording/:recording_id",
  [isLogin, checkRole("musisi"), hitReduce],
  updateRecording
);

router.delete(
  "/recording/:recording_id",
  [isLogin, checkRole("musisi"), hitReduce],
  deleteRecording
);

module.exports = router;
