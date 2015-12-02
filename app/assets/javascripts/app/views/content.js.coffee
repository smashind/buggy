class App.Views.Content extends Backbone.View

  className: "container"

  template: HandlebarsTemplates['app/templates/content']

  render: ->
    @$el.html(@template())
    @renderEmptyView()
    @renderProjectsView()
    @

  renderEmptyView: ->
    v = new App.Views.Empty()
    @$('#main-area').html(v.render().el)

  renderProjectsView: ->
    v = new App.Views.Projects({ collection: new App.Collections.Projects })
    @$('#sidebar-area').html(v.render().el)
