const express = require('express');
const router = express.Router();

// Import musisi controller
const { registerMusisi, loginMusisi, inviteMusisi, uploadRecording, deleteProject } = require('../controllers/musisiController');

router.put('/register/:user_id', registerMusisi);
router.post('/login', loginMusisi);
router.post('/invite', inviteMusisi);
router.post('/upload', uploadRecording);
router.delete('/project/:project_id', deleteProject);

module.exports = router;
