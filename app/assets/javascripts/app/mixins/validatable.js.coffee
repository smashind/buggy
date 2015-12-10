App.Mixins.Validatable = 
  renderErrors: (model, errors) ->
    @$('.form-group').removeClass('has-error')
    @$('span.help-block').remove()
    _.each errors, @renderError, @

  renderError: (errors, attribute) ->
    err = errors.join "; "
    @$('#' + attribute).closest('div.form-group').addClass('has-error')
    @$('#' + attribute).closest('div.form-group').append('<span class="help-block">' + err + '</span>')

  parseErrorResponse: (model, resp) ->
    if resp and resp.responseText
      errors = JSON.parse resp.responseText
      @renderErrors(model, errors.errors)