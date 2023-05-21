const express = require('express');
const router = express.Router();

// Import user controller
const { registerUser, loginUser, listenToMusic, giveComment, deleteComment, topUp, recharge } = require('../controllers/userController');

router.post('/register', registerUser);
router.post('/login', loginUser);
router.get('/listen/:recording_id', listenToMusic);
router.post('/comment', giveComment);
router.delete('/comment/:comment_id', deleteComment);
router.put('/topup/:user_id', topUp);
router.put('/recharge/:user_id', recharge);

module.exports = router;
