$(function() {

var charmap = {
  'À':'A', 'Á':'A', 'Â':'A', 'Ã':'A', 'Ä':'A', 'Å':'A', 'Æ':'AE', 'Ç':'C',
  'È':'E', 'É':'E', 'Ê':'E', 'Ë':'E', 'Ì':'I', 'Í':'I', 'Î':'I', 'Ï':'I',
  'Ð':'D', 'Ñ':'N', 'Ò':'O', 'Ó':'O', 'Ô':'O', 'Õ':'O', 'Ö':'O', 'Ő':'O',
  'Ø':'O', 'Ù':'U', 'Ú':'U', 'Û':'U', 'Ü':'U', 'Ű':'U', 'Ý':'Y', 'Þ':'TH',
  'ß':'ss', 'à':'a', 'á':'a', 'â':'a', 'ã':'a', 'ä':'a', 'å':'a', 'æ':'ae',
  'ç':'c', 'è':'e', 'é':'e', 'ê':'e', 'ë':'e', 'ì':'i', 'í':'i', 'î':'i',
  'ï':'i', 'ð':'d', 'ñ':'n', 'ò':'o', 'ó':'o', 'ô':'o', 'õ':'o', 'ö':'o',
  'ő':'o', 'ø':'o', 'ù':'u', 'ú':'u', 'û':'u', 'ü':'u', 'ű':'u', 'ý':'y',
  'þ':'th', 'ÿ':'y', '©':'c'
};

var toReplace = '';
for (var c in charmap) {
  toReplace += c;
}
var replacementPattern = new RegExp('[' + toReplace + ']', 'g');

var mappedCharacter = function(char) {
  return charmap[char];
};

var transliterate = function(string) {
  return string.replace(replacementPattern, mappedCharacter);
};


// do realtime generation of the post's permalink as a parameterized version of the title
// but ONLY when writing a new post (do not change an existing post's permalink if the title
// changes)
$('#new_post').find('#post_title').keyup(function(event) {
  var title  = $(this).val();
  var target = $(this).closest('ol').find('#post_permalink');

  var parameter = transliterate(title);
  parameter     = parameter.toLowerCase();
  parameter     = parameter.replace(/[^a-z0-9\-_]+/g, '-');
  parameter     = parameter.replace(/-{2,}/g, '-');
  parameter     = parameter.replace(/^-|-$/g, '');

  target.val(parameter);
});

});
