module.exports = (robot) ->
  robot.respond /(google|search)( me)? (.*)/i, (msg) ->
    msg
      .http("https://www.googleapis.com/customsearch/v1")
      .query
        key: process.env.GOOGLE_SEARCH_KEY
        cx: process.env.GOOGLE_SEARCH_CX
        fields: "items(title,link)"
        num: 5
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
