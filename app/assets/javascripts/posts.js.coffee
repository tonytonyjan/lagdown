$ () -> 
  $('.preview-btn').click () ->
    text_source = $(this.getAttribute('data-source'))
    display_target = $(this.getAttribute('data-target'))
    $.ajax
      url: '/preview'
      type: 'POST'
      data:
        text: text_source.val()
    .done (data) ->
      display_target.html data