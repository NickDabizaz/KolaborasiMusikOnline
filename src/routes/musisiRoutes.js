const express = require('express');
const router = express.Router();

// Import musisi controller
const { registerMusisi, uploadRecording } = require('../controllers/musisiController');

router.put('/register/:user_id', registerMusisi);
router.post('/upload', uploadRecording);

module.exports = router;
