if $('body[data-controller="settings/posts"]').length > 0 && $('form').length > 0
  editor = ace.edit('editor')
  editor.setTheme('ace/theme/twilight')
  editor.setFontSize(16)
  editor.getSession().setMode('ace/mode/markdown')
  editor.getSession().setUseWrapMode(true)
  editor.getSession().setUseSoftTabs(true)
  editor.getSession().setTabSize(2)
  editor.setValue($('#post_content').val(), 1)
  editor.focus()

  $('#preview_btn').click () ->
    $.ajax
      url: '/preview'
      type: 'POST'
      data:
        text: editor.getValue()
    .done (data) ->
      $('#preview_area').html data
      hljs.highlightBlock(e) for e in $('#preview_area pre code')
      MathJax.Hub.Queue(["Typeset",MathJax.Hub]) if !!MathJax
  .trigger('click')
  $('form').submit () ->
    $('#post_content').val(editor.getValue())