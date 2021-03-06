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
  var color = $('#color').val();
  if(color == "blue"){
    editor.setTheme("ace/theme/textmate");
  }
  else if(color == "orange"){
    editor.setTheme("ace/theme/tomorrow");
  }
  else if(color == "gray"){
    editor.setTheme("ace/theme/github");
  }
  else if(color == "yellow"){
    editor.setTheme("ace/theme/clouds");
  }
  else if(color == "red"){
    editor.setTheme("ace/theme/tomorrow");
  }
  else if(color == "green"){
    editor.setTheme("ace/theme/eclipse");
  }
  else if(color == "violet"){
    editor.setTheme("ace/theme/dreamweaver");
  }
  editor.getSession().setMode("ace/mode/html");
  
  editor.focus();
  editor.renderer.updateFull(); 
  $("#close-fail-lesson").on("click", function(){
    $("#fail-lesson").toggle();
  });
  
  $("#close-next-lesson").on("click", function(){
     $("#level-group").toggle();
  });

  $("#reset-button").on("click", function(){
    editor.getSession().setValue($('#level-default').text());
    //editor.getSession().setValue("<!DOCTYPE html>\n<html>\n\n\n\n\n\n\n\n<\/html>");
  });

  $("#submit-button").on("click", function(){
    var isVisible = $( "#fail-lesson" ).is( ":visible" );
    if(isVisible)
      $("#fail-lesson").toggle();
    var levelAnswer = $('#level-answer').val();
    var submittedCode = editor.getSession().getValue();
    var validationMessage = validate(levelAnswer, submittedCode);
    console.log("validationMessage: " + validationMessage);
    if(validationMessage != ""){
      $("#validation-error").text(validationMessage);
      $("#fail-lesson").toggle();
    }else{  
      $.ajax({
        type:'GET',
        url:'/home/submitCode',
        data: { subcode: submittedCode
           },
        success:function(){
        //change the appearance of this button to next level
        console.log("successs");
        $("#level-group").toggle();
        }
      });
    }
  });
 
  var validate = function(levelAnswer, submittedCode) {
    console.log("levelAnswer, submittedCode: " + levelAnswer + ", " + submittedCode);
    var errorMessage = "";
    levelAnswer = levelAnswer.toLowerCase();
    submittedCode = submittedCode.toLowerCase();
    //level 1 no validation
    if(levelAnswer == "<!doctype html><strong>feel free to change this text.</strong>" || levelAnswer == submittedCode)
      return errorMessage;
    else{
      var nospace1 = levelAnswer.replace(/\s+/g, '');
      var nospace2 = submittedCode.replace(/\s+/g, '');
      if(nospace1 == nospace2)
        return errorMessage;
      else{
        if(submittedCode == "" || !submittedCode.startsWith("<!doctype html>"))
          return "Your DOCTYPE tag doesn't look quite right. Did you type it like this: <!DOCTYPE html> ?";
        else if(!submittedCode.includes("<html>"))
          return "Make sure you put in your open <html> tag!"
        else if(!submittedCode.includes("</html>"))
          return "Make sure you put in your close </html> tag!"
      }
    }
    return errorMessage;
  }; 
  
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
  
  render();  

};

$(document).ready(ready);
$(document).on('page:load', ready);
    
    `
 
