const express = require('express');
const router = express.Router();

// Import user controller
const { registerUser, loginUser, listenToMusic, giveCommentOrFeedback, deleteCommentOrFeedback, topUp, recharge } = require('../controllers/userController');

router.post('/register', registerUser);
router.post('/login', loginUser);
router.post('/listen', listenToMusic);
router.post('/comment', giveCommentOrFeedback);
router.delete('/comment/:id', deleteCommentOrFeedback);
router.post('/topup', topUp);
router.post('/recharge', recharge);

module.exports = router;
