express = require('express')
morgan = require('morgan')
compress = require('compression')
bodyParser = require('body-parser')
cookieParser = require('cookie-parser')
session = require('express-session')
sequelize = require('sequelize')

orm = require('orm')
database = require('./app/database')

schedule = require('node-schedule')

fx = require('money')

jwt = require('jwt-simple')
server = express()

server.use(orm.express('pg://abhihnahgxvxim:WTaDQYg7roQaOx0ieKNDoKZ-V-@ec2-54-197-238-242.compute-1.amazonaws.com:5432/d4ielacnr2v55l?ssl=true&pool=true', {
  define: database
}))

server.use((req, res, next) ->

    res.header('Access-Control-Allow-Origin', '*')

    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE')

    res.header('Access-Control-Allow-Credentials', true)

    if req.method is 'OPTIONS' then res.send(200) else next()
)

server.use(cookieParser())

server.use(bodyParser({
  maxBodySize: 65535,
  mapParams: false
}))

server.use(express.static("#{__dirname}/../MobileClient/www"))

server.use(session({secret: 'ilovekittiessomuch'}))

require('./config/scheduler').start(schedule, fx)

require('./config/jwtAuth.js')(server)

require('./app/routes.js')(server, fx, jwt)

port = process.env.PORT or 1337

server.listen(port, () ->
    console.log("listening at #{port}")
)