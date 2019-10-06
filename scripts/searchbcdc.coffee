# Description:
#   A way to interact with the Google Custom Search API
#
# Dependencies:
#   None
#
# Configuration:
#   GOOGLE_API_KEY
#   GOOGLE_CUSTOM_SEARCH
#
# Commands:
#   dbc-bot find <query> - returns URL's and Title's for 3 first results from custom search
#
# Notes:
#   Limits for free version is 100 queries per day per API key
module.exports = (robot) ->
  robot.respond /(find)( me)? (.*)/i, (msg) ->
    msg
      .http("https://www.googleapis.com/customsearch/v1")
      .query
        key: process.env.GOOGLE_API_KEY
        cx: process.env.GOOGLE_CUSTOM_SEARCH
        fields: "items(title,link)"
        num: 3
        q: msg.match[3]
      .get() (err, res, body) ->
        resp = "";
        results = JSON.parse(body)
        if results.error
          results.error.errors.forEach (err) ->
            resp += err.message
        else
          results.items.forEach (item) ->
            resp += item.title + " - " + item.link + "\n"

        msg.send resp
