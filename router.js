const express = require('express');
const router = express.Router();

const userController = require('./controllers/userController');

//RUTAS PARA USUARIOS//
router.get('/api/getUsers', userController.getUsers);
router.get('/api/getUserByphone', userController.getUserByPhone);
router.post('/api/postRegisterUser', userController.postRegisterUser);
router.post('/api/postLogin', userController.postLogin);



module.exports = router;
