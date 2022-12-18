const conexion = require('../database/db');




//ASYNC FUNCTIONS
//CRUD FUNCTIONS
async function getUsers(req, res) {
    try {
        const result = await conexion.manyOrNone('select * from usuario');
        return res.status(200).json(result);
    } catch (error) {
        console.log(error);
    }

}

async function getUserByPhone(req, res) {
    try {
        const result = await conexion.manyOrNone('select * from usuario where phone=$1', [req.body.phone]);
        return res.status(200).json(result);
    } catch (error) {
        console.log(error);
    }

}
async function postRegisterUser(req, res) {
    try {

        await conexion.none('insert into  usuario values ($1,$2,$3,$4)', [req.body.name, req.body.last_name, req.body.phone, req.body.password]);
        return res.status(200).json("El usuario se ha registrado exitosamente!");
    } catch (error) {
        console.log(error);
    }
}


//LOGIN FUNCTION
async function postLogin(req, res) {
    try {
        const result = await conexion.oneOrNone('select name,last_name,phone from usuario where phone=$1 and password=$2', [req.body.phone, req.body.password]);
        return res.status(200).json(result);
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    getUsers,
    getUserByPhone,
    postRegisterUser,
    postLogin
}