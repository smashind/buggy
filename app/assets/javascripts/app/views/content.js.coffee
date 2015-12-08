class App.Views.Content extends Backbone.View

  className: "container"

  template: HandlebarsTemplates['app/templates/content']

  render: ->
    @$el.html(@template())
    @

  initialize: ->
    @listenTo App.Vent, "project:create", @swapMainToEmpy
    @listenTo App.Vent, "project:new", @swapMainToNewProject

  swapMainToEmpy: ->
    @swapMain(new App.Views.Empty())
    Backbone.history.navigate("/projects")

  swapMainToNewProject: ->
    @swapMain(new App.Views.NewProject({ model: new App.Models.Project }))
    Backbone.history.navigate("/projects/new")

  swapMain: (v) ->
    @changeCurrentMainView(v)
    @$('#main-area').html(@currentMainView.render().el)

  changeCurrentMainView: (v) ->
    @currentMainView.remove() if @currentMainView
    @currentMainView = v

  swapSide: (v) ->
    @changeCurrentSideView(v)
    @$('#sidebar-area').html(@currentSideView.render().el)

  changeCurrentSideView: (v) ->
    @currentSideView.remove() if @currentSideView
    @currentSideView = v
