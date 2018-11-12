import express = require('express')

import { create } from 'express-handlebars'
import exphbs  = require('express-handlebars')
import session = require('express-session')


import {authentificationRoute , routeGuard} from './routes/authentification-route'


import {
    userDB
} from './routes'

require('dotenv').config() 


const app = express()


const hbsOptions : ExphbsOptions = {
    defaultLayout:'main',
    extname:".hbs",
}

const hbs = create(hbsOptions)

app.engine('hbs',hbs.engine).set('view engine','hbs')




app.set('views', __dirname + '/views')

/*app.set('view engine', 'handlebars')
app.engine('handlebars', exphbs({
    defaultLayout: 'main',
    layoutsDir: __dirname + '/views/layouts'
}))*/



const sessionoptions = {
    secret: 'secret key'
}


app.use(
    session(sessionoptions),
    express.urlencoded(),
   authentificationRoute, 
   userDB
)



app.get('/intern',routeGuard ,(req,res)=>{
    const session = req.session as Express.Session

    console.log(session.user)
    res.send("intern")
})

app.get('/', (req,res)=> {
    res.send("test")
})





app.listen(3000,()=>{
    console.log("App läuft")
})