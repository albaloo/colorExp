# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
`
var ready;
ready = function() {
  
  var Storage = {
    set: function(key, value) {
        localStorage[key] = JSON.stringify(value);
    },
    get: function(key) {
        return localStorage[key] ? JSON.parse(localStorage[key]) : null;
    }
  };

  Storage.set('currentLevel', 1); 

  var editor = ace.edit("editor");
  editor.setTheme("ace/theme/textmate");
  editor.getSession().setMode("ace/mode/html");

  $("#reset-button").on("click", function(){
    editor.getSession().setValue("<!DOCTYPE html>\n<html>\n\n\n\n\n\n\n\n<\/html>");
  });

  $("#submit-button").on("click", function(){
    var submittedCode = editor.getSession().getValue();
    //console.log(submittedCode);
    $.ajax({
      type:'GET',
      url:'/home/submitCode',
      data: { subcode: submittedCode
           },
      success:function(){
      //change the appearance of this button to next level
      //$(this).remove();
      console.log("successs");
      $("#level-group").toggle();
      }
    });
  });
 
  
  // Attaching the onkeyup Event
  editor.getSession().on('change', function() {
        // The function that'll prepare the code and inject
        // into the iframe.
        render();
 
    });

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
    var html = editor.getSession().getValue(); //$(editor).html(),
        src = '';
 
    // HTML
    src = base_tpl.replace('</body>', html + '</body>');
     
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
 
