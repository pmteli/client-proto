class DemoFirstengage.Models.Portfolio extends Backbone.Model

  initialize: ->
    this.on("click:building_name", handleClick)

  handleClick: ->
    console.log("item is clicked.")

