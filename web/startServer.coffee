express = require("express");
logfmt = require("logfmt");
exec = require('child_process').exec;

app = express();

console.log('Running Grunt tasks')

exec('grunt build', (error, stdout, stderr)->
  console.log(stdout)
  console.log(stderr)

  app.use(logfmt.requestLogger())

  app.use(express.static(__dirname + '/dist/app'))

  port = Number(process.env.PORT || 9000)

  app.listen(port, ->
    console.log("Listening on " + port)
  )

)
