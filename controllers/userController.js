const conexion = require('../database/db');


async function getUsers(req, res, next) {
    try {
        const result = await conexion.manyOrNone('select * from usuario');
        return res.status(200).json(result);
    } catch (error) {
        console.log(error);
    }

}


module.exports={
    getUsers
}