express = require 'express'
app = express()
googleImages = require './api/googleImages'

app.get '/', (request, response) ->
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


console.log 'Listening on port 5000'
app.listen(5000)
