http = require 'http'

GoogleImages =
    endpoint: "http://ajax.googleapis.com/ajax/services/search/images?v=1.0&start=1&q="

    makeQuery: (_url, callback) ->
        http.get _url, (response) ->
            data = ''
            response.on 'data', (chunk) ->
                data = data + chunk
            response.on 'end', ->
                responseJson = JSON.parse(data)
                if responseJson['responseData']?
                    callback(responseJson['responseData'])
                else
                    callback({})

    search: (query, callback) ->
        @makeQuery "#{@endpoint}" + query.replace(/\s/g, '+'), callback

module.exports = GoogleImages
