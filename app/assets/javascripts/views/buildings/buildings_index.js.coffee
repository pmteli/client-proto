class DemoFirstengage.Views.BuildingsIndex extends Backbone.View

  template: JST['buildings/index']

  initialize: (collection) ->
    #@collection = collection
    @collection.on('reset', this.render, this)

  render: ->
    $(@el).html(@template(buildings: @collection))
    this

