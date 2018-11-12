
import {Router} from 'express'
import {Request,Response , RequestHandler , NextFunction} from 'express'
import { Database } from '../model/dbAccess'



const app = Router()



class AuthentificationService {
        
    db = new Database()

    getUser(email:string, password:string){
        return this.db.selectUser(email, password)  
    }
}

const authentificationService = new AuthentificationService()


app.get('/login',(req,res)=>{
    res.render('login')
})

app.post('/login',(req,res,next)=>{
    console.log(req.body)
    const session = req.session as Express.Session

    authentificationService.getUser(req.body.email, req.body.password)
        .then( user => {
            if(user != undefined) {
                session.user = user
                res.redirect('/intern')
            } else {
                res.redirect('/login')
            }
        })
        .catch(e=>{
            next(e)
        })

})

function routeGuard(req:Request,res:Response,next:NextFunction){
    const session = req.session as Express.Session

    if(session.user == undefined){
        res.redirect('/login')
    } else {
        next()
    }  
}


export {
    app as authentificationRoute,
    routeGuard
}