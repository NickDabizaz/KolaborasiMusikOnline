const express = require('express');
const router = express.Router();

// Import produser controller
const { registerProduser, createProject, searchMusisi, inviteMusisi, deleteProjectPost } = require('../controllers/produserController');

router.put('/register/:user_id', registerProduser);
router.post('/project', createProject);
router.get('/search', searchMusisi);
router.post('/invite', inviteMusisi);
router.delete('/project/:id', deleteProjectPost);

module.exports = router;
