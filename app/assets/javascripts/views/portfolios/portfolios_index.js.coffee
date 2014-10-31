class DemoFirstengage.Views.PortfoliosIndex extends Backbone.View

  template: JST['portfolios/index']

  initialize: ->
    @collection.on('reset', this.render, this)

  render: ->
    $(@el).html(@template(buildings: @collection))
    # need to copy this into self. OTHERWISE "this" will be lost inside the loop below
    self = this
    @collection.each (model) ->
      building = new DemoFirstengage.Views.BuildingsOne(model)
      console.log("adding building for .." + model.get('building_name'))
      #following is a weird way of adding subviews. Not sure how eco template is working. Why can't I simply append subviews to self.$el ?
      $(self.$el[0]).find('#buildings-list').append(building.render().el)
    this
