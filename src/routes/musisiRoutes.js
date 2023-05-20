const express = require('express');
const router = express.Router();

// Import musisi controller
const { registerMusisi, loginMusisi, createProject, inviteMusisi, uploadRecording, giveCommentOrFeedback, deleteProject } = require('../controllers/musisiController');

router.post('/register', registerMusisi);
router.post('/login', loginMusisi);
router.post('/project', createProject);
router.post('/invite', inviteMusisi);
router.post('/upload', uploadRecording);
router.post('/comment', giveCommentOrFeedback);
router.delete('/project/:id', deleteProject);

module.exports = router;
