const express = require('express');
const router = express.Router();

// Import produser controller
const { registerProduser, loginProduser, createProjectPost, searchMusisi, inviteMusisi, deleteProjectPost } = require('../controllers/produserController');

router.post('/register', registerProduser);
router.post('/login', loginProduser);
router.post('/project', createProjectPost);
router.post('/search', searchMusisi);
router.post('/invite', inviteMusisi);
router.delete('/project/:id', deleteProjectPost);

module.exports = router;
