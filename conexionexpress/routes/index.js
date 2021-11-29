const express = require('express')
const actions = require('../methods/actions')
const router = express.Router()

router.get('/', (req, res) =>{
    res.send('Hello World')
})

router.get('/dashboard', (req, res) =>{
    res.send('Dashboard')
})

//Obteneiendo info usuario
//@desc GET info on a user
//@route GET /getinfo
router.get('/getinfo', actions.getinfo)

//Añadiendo nuevo usuario
//@desc Adding new user
//@route POST /adduser
router.post('/adduser', actions.addNew)

//Autenticando usuario
//@desc Authenticate a user
//@route POST /authenticate
router.post('/authenticate', actions.authenticate)



module.exports = router