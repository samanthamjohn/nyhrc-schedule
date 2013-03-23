changeDay = (day) ->
  klass = $(".weekday-wrapper").data("weekday")
  $(".weekday-wrapper").removeClass(klass)
  $(".weekday-wrapper").addClass(day)
  $(".weekday-wrapper").data("weekday", day)
  $(".weekday-link.#{klass}").removeClass("active")
  $(".weekday-link.#{day}").addClass("active")

$(".weekday-link a").on("click", (e) ->
  e.preventDefault()
  $target = $(e.target)
  changeDay($target.data("weekday"))
  history.pushState({day : $target.data("weekday")}, $target.text, $target.data("weekday"))
)

window.onpopstate = (e)->
  if e.state
    day = e.state.day
    changeDay(day)
  else
    history.pushState({day : $(".weekday-wrapper").data("weekday")}, $(".weekday-wrapper").data("weekday"), "")
