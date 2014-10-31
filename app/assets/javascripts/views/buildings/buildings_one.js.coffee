class DemoFirstengage.Views.BuildingsOne extends Backbone.View

  template: JST['buildings/building']
  tagName: 'tr'

  initialize: (model) ->
    @model = model
    @model.on('reset', this.render, this)
    @model.on('change', this.render, this)

  events: ->
    'click' : this.handleClick
    'mouseover' : this.handleMouseover
    'mouseout'  : this.handleMouseout

  handleClick: (e) ->
    console.log("row clicked for " + this.model.get("building_name"))

  handleMouseover: (e) ->
    console.log("mouseover for " + this.model.get("building_name"))
    #this.$el.attr( "class", "highlight" );
    this.$el.addClass('highlight')

  handleMouseout: (e) ->
    #this.$el.attr( "class", "highlight" );
    this.$el.removeClass('highlight')

  render: ->
    $(@el).html(@template(building: @model))
    this.$el.find("td.number").number(true, 0);
    this



