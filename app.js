const express = require('express');
const app = express();
const route = require('./router')

app.use(express.json())
app.use(express.urlencoded({ extended: true }))

//ENDPOINTS USERS
app.use('/', route);

app.listen(5000, () => {
    console.log('SERVER corriendo en http://localhost:5000');
});