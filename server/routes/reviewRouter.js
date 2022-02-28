const express = require('express')
const router = express.Router()
const mysql = require('../config')

router.get('/:id', async(req, res, next) =>{
    let id = req.params.id
    const sql = `
        SELECT album_score.title, album_score.score, album_score.comment, 
        user.username AS user
        FROM album_score
        JOIN user ON album_score.user_id = user.id
        AND album_score.id = ?
    `
    mysql.execute(sql, [id])
        .then(([rows, fields]) => {
            res.send(JSON.stringify(rows))
        })
})

module.exports = router