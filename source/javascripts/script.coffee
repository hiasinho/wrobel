#= require jquery

$(document).ready ->

  shuffle = (o) -> #v1.0
    j = undefined
    x = undefined
    i = o.length

    while i
      j = Math.floor(Math.random() * i)
      x = o[--i]
      o[i] = o[j]
      o[j] = x
    o

  imageShuffle = shuffle [1,2,3]
  imageNumbers = []
  imageLast = undefined

  imageClass = (number) ->
    return "slider" + number

  header = $('#header')
  changeImage = ->
    imageNumbers = imageShuffle.slice() if imageNumbers.length == 0
    if imageLast
      header.removeClass(imageClass(imageLast))

    imageLast = imageNumbers.pop()
    header.addClass(imageClass(imageLast))

    setTimeout(changeImage, 7200)

  

  blackFooter = ->
    if $('#header > .container').outerHeight() > window.innerHeight
      $('#footer').addClass('scroll')
    else if $('#footer').hasClass('scroll')
      $('#footer').removeClass('scroll')
    

  changeImage()
  blackFooter()

  $(window).resize ->
    blackFooter()
    