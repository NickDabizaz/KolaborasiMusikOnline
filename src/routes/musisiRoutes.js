const express = require('express');
const router = express.Router();

// Import musisi controller
const { registerMusisi, uploadRecording } = require('../controllers/musisiController');

const isLogin = require('../middleware/isLogin');
const checkRole = require('../middleware/checkRole');

router.put('/register/:user_id', registerMusisi);
router.post('/upload',[isLogin, checkRole("musisi")], uploadRecording);

module.exports = router;
