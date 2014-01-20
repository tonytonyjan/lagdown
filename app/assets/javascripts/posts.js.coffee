$(document).on 'ready page:change', () ->
  if $('body[data-controller="settings/posts"]') && $('form').length > 0
    editor = ace.edit('editor')
    editor.setTheme("ace/theme/textmate")
    editor.getSession().setMode("ace/mode/markdown")
    editor.setFontSize(16)
    editor.setValue($('#post_content').val())

    $('#preview_btn').click () ->
      $.ajax
        url: '/preview'
        type: 'POST'
        data:
          text: editor.getValue()
      .done (data) ->
        $('#preview_area').html data
    $('form').submit () ->
      $('#post_content').val(editor.getValue())