class DemoFirstengage.Routers.Buildings extends Backbone.Router
  routes:
    '' : 'index'
    'buildings/:id' : 'show'
    'home/portfolio' : 'portfolio'


  initialize: ->
    @collection = new DemoFirstengage.Collections.Buildings()
    @collection.fetch({reset:true})

  index: ->
    view = new DemoFirstengage.Views.BuildingsIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "buildings #{id}"

  portfolio: ->
    view = new DemoFirstengage.Views.BuildingsIndex(collection: @collection)
    $('#list-map').html(view.render().el)




