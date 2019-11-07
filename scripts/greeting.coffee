# Description:
#   Greetings!
#
# Commands:
#   hello/hi, dbcbot - responds with a greeting. Comma optional.

module.exports = (robot) ->
  robot.hear /(hello,? bot|hi,? bot)/i, (res) ->
    res.send "Hello! I'm DataBot! You can find out what I do by typing `databot help`. I am able to listen to any channel, but you have to add me to the channel or I can't respond! So please feel free to use those to experiment with me. I hope to be very helpful :P"
