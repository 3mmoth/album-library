const express = require('express')
const router = express.Router()
const mysql = require('../config')


router.get('/', async(req, res, next) =>{
    const sql = `
        SELECT album.title, album.id, band.name AS band
        FROM album
        JOIN compose ON album.id = compose.album_id
        JOIN band ON compose.band_id = band.id
        GROUP BY album.title
    `

    mysql.execute(sql)
        .then(([rows, fields]) => {
            res.send(JSON.stringify(rows))
        })
})

router.get('/:id', async(req, res, next) =>{
    const id = req.params.id
    const sql = `
        SELECT album.title, AVG(album_score.score) AS score, album.release_year, 
        band.name AS band, genre.name AS genre
        FROM album
        JOIN album_score ON album.id = album_score.id AND album.id = ?
        JOIN compose ON album.id = compose.album_id
        JOIN band ON compose.band_id = band.id
        JOIN genre on album.genre_id = genre.id
        GROUP BY band.id
    `

    mysql.execute(sql, [id])
        .then(([rows, fields]) => {
            res.send(JSON.stringify(rows))
        })
})

module.exports = router

