const express = require('express');
const router = express.Router();

// Import produser controller
const { registerProduser, createProject, searchMusisi, inviteMusisi, deleteProjectPost, searchProject, uploadPoster, getPoster } = require('../controllers/produserController');

const isLogin = require('../middleware/isLogin');
const checkRole = require('../middleware/checkRole');
const isMember = require('../middleware/isMember');

router.put('/register/',[isLogin, isMember], registerProduser);
router.post('/project',[isLogin, checkRole("produser")], createProject);
router.get('/search',[isLogin, checkRole("produser")], searchMusisi);
router.get('/project',[isLogin, checkRole("produser", "musisi", "member")], searchProject);
router.post('/invite',[isLogin, checkRole("produser")], inviteMusisi);
router.delete('/project/:project_id',[isLogin,checkRole("produser")], deleteProjectPost);
router.post("/uploadPoster", [isLogin], uploadPoster)
router.get("/poster/:project_id", getPoster)

module.exports = router;
