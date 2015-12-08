class App.Views.Header extends Backbone.View
  className: "navbar navbar-default navbar-static-top"

  template: HandlebarsTemplates['app/templates/header']

  render: ->
    @$el.html(@template())
    @
