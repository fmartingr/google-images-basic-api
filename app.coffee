express = require 'express'
app = express()
googleImages = require './api/googleImages'

app.get '/:q', (request, response) ->
    googleImages.search request.params.q, (images) ->
        numResults = 1
        console.log request.query
        if request.query.limit?
            numResults = parseInt(request.query.limit)

        result =
            error: null
            items: []

        if images?
            for i in [0..numResults-1]
                console.log i
                if images['results'][i]?
                    url = images['results'][i]['unescapedUrl']
                    result.items.push url
        else
            result.error = true
        response.send result
        response.end


console.log 'Listening on port 5000'
app.listen(5000)
