const express = require('express')
const router = express.Router()
const mysql = require('../config')

router.get('/', async(req, res, next) =>{
    let id = req.params.id
    const sql = `
        SELECT name AS band, id
        FROM band
        `

    mysql.execute(sql)
        .then(([rows, fields]) => {
            res.send(JSON.stringify(rows))
        })
})
router.get('/:id', async(req, res, next) => {
    let id = req.params.id
    const sql = `
        SELECT album.title, album.id, 
        band.name AS band
        FROM album
        JOIN compose ON album.id = compose.album_id
        JOIN band on compose.band_id = band.id AND band.id = ?
    `

    mysql.execute(sql, [id])
        .then(([rows, fields]) => {
            res.send(JSON.stringify(rows))
        })
})

module.exports = router