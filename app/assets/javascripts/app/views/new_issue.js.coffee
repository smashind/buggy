class App.Views.NewIssue extends Backbone.View

  template: HandlebarsTemplates['app/templates/new_issue']

  events:
    "click button": "saveIssue"

  initialize: ->
    @listenTo @model, 'error', @parseErrorResponse
    @listenTo @model, 'sync', @success

  success: ->
    App.Vent.trigger "issue:create", @model
    @clearForm()

  clearForm: ->
    @$('#name').val("")
    @$('#description').val("")
    @clearErrors()
    delete @model.id
    @model.unset("id")
    @model.unset("created_at")

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  saveIssue: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save()

_.extend App.Views.NewIssue.prototype, App.Mixins.Validatable