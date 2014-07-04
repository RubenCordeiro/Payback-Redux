jwt = require('jwt-simple')

setup = (server) ->
  server.set('jwtTokenSecret', 'jwtIsAwesomeIndeedNoQuestionAboutIt')

  jwtTokenAuthenticator = (req, res, next) ->
    token = (req.body and req.body.access_token) or (req.query and req.query.access_token) or req.headers['x-access-token']
    if not token then return res.json(401, {error: "Missing token"})

    try
      decoded = jwt.decode(token, server.get('jwtTokenSecret'))

      if (decoded.exp <= Date.now()) then return res.json(400, {error: "Access token has expired"})

      req.models.user.get(decoded.iss, (err, user) ->

        if err or not user then return res.json(400, {error: "Invalid user id"})

        req.user = user
        return next()
      )
    catch err
      return res.json(400, {error: "Error parsing token"})

  server.all('/api/users', jwtTokenAuthenticator)
  server.all('/api/users/*', jwtTokenAuthenticator)

module.exports = setup