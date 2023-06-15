const express = require('express');
const router = express.Router();

// Import musisi controller
const { registerMusisi, uploadRecording } = require('../controllers/musisiController');

const isLogin = require('../middleware/isLogin');
const checkRole = require('../middleware/checkRole');
const isMember = require('../middleware/isMember');

router.put('/register/:user_id',[isLogin, isMember], registerMusisi);
router.post('/upload',[isLogin, checkRole("musisi")], uploadRecording);

module.exports = router;
