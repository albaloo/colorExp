# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
`
var ready;
ready = function() {

var editor = document.querySelector('#html');
 
// Attaching the onkeyup Event
editor.addEventListener('keyup', function() {
 
        // The function that'll prepare the code and inject
        // into the iframe.
        render();
 
    }, false);

// Base template
var base_tpl =
    "<!doctype html>\n" +
    "<html>\n\t" +
    "<head>\n\t\t" +
    "<meta charset=\"utf-8\">\n\t\t" +
    "<title>Test</title>\n\n\t\t\n\t" +
    "</head>\n\t" +
    "<body>\n\t\n\t" +
    "</body>\n" +
    "</html>";
 
var prepareSource = function() {
    var html = editor.value,
        src = '';
 
    // HTML
    src = base_tpl.replace('</body>', html + '</body>');
 
    // CSS
    //css = '<style>' + css + '</style>';
    //src = src.replace('</head>', css + '</head>');
 
    // Javascript
    //js = '<script>' + js + '</script>';
    //src = src.replace('</body>', js + '</body>');
 
    return src;
}; 

var render = function() {
    var source = prepareSource();
 
    var iframe = document.querySelector('#output iframe'),
        iframe_doc = iframe.contentDocument;
 
    iframe_doc.open();
    iframe_doc.write(source);
    iframe_doc.close();
};   

};

$(document).ready(ready);
$(document).on('page:load', ready);
    
    `
 
