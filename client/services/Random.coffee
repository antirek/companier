angular.module 'companier'
.factory 'Random', ()->
  getRandomString: (length = 10)->
    buffer = 'abcdefghijklmnopqrstuvwxyz0123456789'
    result = ''
    while length
      result += buffer[Math.round(Math.random() * (buffer.length - 1))]
      length--
    result