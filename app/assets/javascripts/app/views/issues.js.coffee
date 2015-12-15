class App.Views.Issues extends Backbone.View

  template: HandlebarsTemplates['app/templates/issues']

  initialize: ->
    @childViews = []
    @listenTo App.Vent, "issue:create", @addToCollection
    @listenTo App.Vent, "issue:create", @renderIssue
    # Doesn't work on subsequent submits
    # @listenTo @collection, "add", @updateCounter

  addToCollection: (model) ->
    @collection.add(model)
    # Doesn't work on subsequent submits
    App.Vent.trigger "issues:change", model, @collection.length

  updateCounter: ->
    $('span').text(@collection.length)

  render: ->
    @$el.html(@template({ count: @collection.length }))
    @collection.forEach @renderIssue, @
    @

  renderIssue: (model) ->
    v = new App.Views.Issue({ model: model })
    @childViews.push(v)
    @$('#issues_list').append(v.render().el)