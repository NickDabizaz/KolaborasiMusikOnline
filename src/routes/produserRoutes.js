const express = require('express');
const router = express.Router();

// Import produser controller
const { registerProduser, createProject, searchMusisi, inviteMusisi, deleteProjectPost } = require('../controllers/produserController');

const isLogin = require('../middleware/isLogin');
const checkRole = require('../middleware/checkRole');

router.put('/register/:user_id', registerProduser);
router.post('/project',[isLogin, checkRole("produser")], createProject);
router.get('/search',[isLogin, checkRole("produser")], searchMusisi);
router.post('/invite',[isLogin, checkRole("produser")], inviteMusisi);
router.delete('/project/:id',[isLogin, checkRole("produser")], deleteProjectPost);

module.exports = router;
