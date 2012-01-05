$(function() {

if ($('#ace_editor').size() > 0) {
  var editor = ace.edit('ace_editor');
  editor.setTheme('ace/theme/textmate');

  var TextileMode = require("ace/mode/textile").Mode;
  editor.getSession().setMode(new TextileMode());
  editor.getSession().setValue($('#post_content').val());

  $('#post_content').closest('form').submit(function(event) {
    $(this).find('#post_content').val(editor.getSession().getValue());
  });
}

});
