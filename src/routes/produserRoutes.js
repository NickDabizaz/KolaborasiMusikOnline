const express = require("express");
const router = express.Router();

// Import produser controller
const {
  registerProduser,
  createProject,
  searchMusisi,
  inviteMusisi,
  deleteProjectPost,
  searchProject,
  uploadPoster,
  getPoster,
} = require("../controllers/produserController");

const isLogin = require("../middleware/isLogin");
const hitReduce = require("../middleware/hitReduce");
const checkRole = require("../middleware/checkRole");
const isMember = require("../middleware/isMember");

router.put("/register/", [isLogin, isMember], registerProduser);
router.post(
  "/project",
  [isLogin, checkRole("produser"), hitReduce],
  createProject
);
router.get(
  "/search",
  [isLogin, checkRole("produser"), hitReduce],
  searchMusisi
);
router.get(
  "/project",
  [isLogin, checkRole("produser", "musisi", "member"), hitReduce],
  searchProject
);
router.post(
  "/invite",
  [isLogin, checkRole("produser"), hitReduce],
  inviteMusisi
);
router.delete(
  "/project/:project_id",
  [isLogin, checkRole("produser"), hitReduce],
  deleteProjectPost
);
router.post(
  "/uploadPoster",
  [isLogin, checkRole("produser"), hitReduce],
  uploadPoster
);
router.get("/poster/:project_id", getPoster);

module.exports = router;
