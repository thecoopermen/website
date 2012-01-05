$(function() {

// if there is an ace editor on this page...
if ($('#ace_editor').size() > 0) {
  // set up a new editor object
  var editor = ace.edit('ace_editor');
  editor.setTheme('ace/theme/textmate');

  // set it in Textile mode
  var TextileMode = require("ace/mode/textile").Mode;
  editor.getSession().setMode(new TextileMode());
  editor.getSession().setValue($('#post_content').val());

  // set the editor's properties
  editor.getSession().setTabSize(2);
  editor.getSession().setUseSoftTabs(true);
  editor.setShowPrintMargin(false);

  // make sure the backing form element gets updated when its form submits
  $('#post_content').closest('form').submit(function(event) {
    $(this).find('#post_content').val(editor.getSession().getValue());
  });
}

});
