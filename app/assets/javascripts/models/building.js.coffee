class DemoFirstengage.Models.Building extends Backbone.Model

  initialize: ->
    @url = '/backbone/buildings/' + @get('id')
    @on("change", @handleChange, this)

  handleChange: ->
    console.log("model is changed for " + @get("building_name"))
    @save({
      success: this.success
      error: this.error
    })

    success: ->
      console.log("model saved successfully")

    error: ->
      console.log("model failed to save.")