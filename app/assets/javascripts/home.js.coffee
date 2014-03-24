if $('body[data-controller="home"]').length > 0
  editor = ace.edit('editor')
  editor.setTheme('ace/theme/twilight')
  editor.setFontSize(16)
  editor.getSession().setMode('ace/mode/markdown')
  editor.getSession().setUseWrapMode(true)
  editor.getSession().setUseSoftTabs(true)
  editor.getSession().setTabSize(2)
  editor.setValue($('#welcome_text').text(), 1)
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