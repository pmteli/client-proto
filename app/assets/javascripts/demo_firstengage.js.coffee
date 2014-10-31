window.DemoFirstengage =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new DemoFirstengage.Routers.Buildings()
    new DemoFirstengage.Routers.Portfolios()
    Backbone.history.start()

$(document).ready ->
  DemoFirstengage.initialize()
