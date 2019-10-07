# Description:
#   Greetings!
#
# Commands:
#   hello/hi, dbcbot - responds with a greeting. Comma optional.

module.exports = (robot) ->
  robot.hear /(hello,? dbc-bot|hi,? dbc-bot)/i, (res) ->
    res.send "Hello! I'm DBCbot! You can find out what I do by typing `dbc-bot help`. I am able to listen to any channel, but you must add me to the channel or I can't respond! So please feel free to use those to experiment with me. I hope to be very helpful :)"
