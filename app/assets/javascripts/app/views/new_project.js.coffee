class App.Views.NewProject extends Backbone.View

  template: HandlebarsTemplates['app/templates/new_project']

  events:
    "click button": "saveProject"

  initialize: ->
    @listenTo @model, 'sync', @render
    @listenTo @model, 'invalid', @renderErrors
    @model.fetch() unless @model.isNew()

  renderErrors: (model, errors) ->
    @$('.error').removeClass('error')
    @$('span.help-block').remove()
    _.each errors, @renderError, @

  renderError: (errors, attribute) ->
    err = errors.join "; "
    @$('#' + attribute).closest('div.form-group').addClass('has-error')
    @$('#' + attribute).closest('div.form-group').append('<span class="help-block">' + err + '</span>')

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  saveProject: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save {},
      success: (model) -> App.Vent.trigger "project:create", model