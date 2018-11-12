import mysql2 = require('mysql2/promise')

require('dotenv').config() 

export class Database{

    private readonly pool = mysql2.createPool({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASS,
        database: process.env.DB_NAME,
        timezone: 'Z',
        waitForConnections: true,
        connectionLimit: 10,
        queueLimit: 0
    })

    async selectAllUsers() {
        const [rows,fields] = await this.pool.query(`select * from mitarbeiter`)
        return rows
    }
    
    async selectUser(email:string, password:string){
        const [rows, fields] = await this.pool.query(`select * from mitarbeiter where email="${email}" AND password="${password}"`)
        return rows
    }

    async selectTime(userID:number){
        const [rows, fields] = await this.pool.query(`
            select * from arbeitszeiten where userID="${userID}" group by month(datum)
        `)
        return rows
    }

    async workTime(userID:number){
        const temp = await this.pool.query(`
            SET lc_time_names = 'de_DE'
        `)
        const [rows, fields] = await this.pool.query(`
            select
            sum(ende - beginn - pausenzeit) as arbeitszeit,
            sum(sollarbeitszeit) as sollarbeitszeit,
            sum(sollarbeitszeit) - sum(ende - beginn - pausenzeit) as saldo,
            monthname(datum) as monat,
            year(datum) as jahr 
            from arbeitszeiten 
            where userID="${userID}" group by year(datum), month(datum)
        `)
        return rows
    }

    async carryoverWorkTime(userID:number){
        const [rows, fields] = await this.pool.query(`
            select 
            sum(sollarbeitszeit) - sum(ende - beginn - pausenzeit) as jahressaldo,
            year(datum) as jahr
            from arbeitszeiten
            where userID="${userID}" group by year(datum)
        `)
        return rows
    }

}

