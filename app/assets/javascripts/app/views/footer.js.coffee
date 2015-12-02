class App.Views.Footer extends Backbone.View
  className: "container"

  template: HandlebarsTemplates['app/templates/footer']

  render: ->
    @$el.html(@template())
    @