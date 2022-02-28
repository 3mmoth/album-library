const express = require('express')
const cors = require('cors')
const app = express()
const port = 5500

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: false }))

//Routes used in the app: albums, bands, reviews
app.use('/albums', require('./routes/albumRouter'))
app.use('/bands', require('./routes/bandRouter'))
app.use('/reviews', require('./routes/reviewRouter'))

app.listen(port, () => {
    console.log(`Listening at http://localhost:${port}`)
})

module.exports = app