import { Database } from '../model/dbAccess'

import express = require('express')
const router = express.Router()

const db = new Database()


require('dotenv').config() 

router.get('/dbtest',(req,res)=>{
    db.selectAllUsers()
        .then(results => {
            console.log(results)
            res.json(results)
        })
        .catch(error => {
            res.json(error)
        })
})
/*
router.get('/dbtest2',(req,res)=>{
    db.selectUser("claus@bwsa.de", "pw")
        .then(results =>{
            res.json(results)
        })
        .catch(error => {
            res.json(error)
        })
})
*/

router.get('/zeit',(req,res)=>{
    db.selectTime(1)
        .then(results => {
            res.json(results)
        })
        .catch(error => {
            res.json(error)
        })

})

router.get('/zeittest',(req,res)=>{
    db.workTime(1)
        .then(results => {
            console.log(results)
            res.json(results)
        })
        .catch(error => {
            res.json(error)
        })
})

router.get('/jahressaldo',(req,res)=>{
    db.carryoverWorkTime(1)
        .then(results => {
            console.log(results)
            res.json(results)
        })
        .catch(error => {
            res.json(error)
        })
})

export {router as userDB}