const express = require('express');
const router = express.Router();

const userController = require('./controllers/userController');

//RUTAS PARA USUARIOS//
router.get('/', userController.getUsers)


module.exports = router;