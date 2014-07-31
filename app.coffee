require 'coffee-script'
express = require 'express'
app = express()
googleImages = require './api/googleImages'

app.get '/', (request, response) ->
    response.setHeader "Access-Control-Allow-Origin", "*"
    googleImages.search request.query.q, (images) ->
        numResults = 1
        if request.query.limit?
            numResults = parseInt(request.query.limit)

        result =
            error: null
            items: []

        if images?
            for i in [0..numResults-1]
                if images['results'][i]?
                    url = images['results'][i]['unescapedUrl']
                    result.items.push url
        else
            result.error = true
        response.send result
        response.end


port = process.env.VCAP_APP_PORT || 3000
console.log "Listening on port #{port}"
app.listen(port)
