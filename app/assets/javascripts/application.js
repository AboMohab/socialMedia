// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var main = function() {
  $(this).submit(function() {
    var firstName = $('#first').val();
    
    if(firstName === "") {
      $('.first-name-error').text('Please enter your first name');
    	$('#first').css('border','1px solid red');  
      
    }
    else if (firstName.length < 2) {
      $('#first').val("");
    $('.first-name-error').text('Your first name must be at least 2 letters.');
       $('#first').css('border','1px solid red');
     }
	 return false;
  })
  
  $(this).submit(function() {
 
    var lastName = $('#last').val();
        
     if (lastName === "") {
    $('.last-name-error').text('Please enter your last name');
       $('#last').css('border','1px solid red'); 
  }
  else if (lastName.length < 2) {
    $('#last').val("");
    $('.last-name-error').text('Your last name must be at least 2 letters.');
       $('#last').css('border','1px solid red');
     }
   
    return false;
  })
  
  $(this).submit(function() {
 
    var email = $('#email').val();
        
     if (email === "") {
    $('.email-error').text('Please enter your email address');
       $('#email').css('border','1px solid red'); 
  }
   
   
    return false;
  })
  
  
   $(this).submit(function() {
 
    var password = $('#password').val();
        if (password === "") {
          $('.password-error').text('Please enter a password.');
          $('#password').css('border','1px solid red');
        }
     else if (password.length < 4) {
    $('.password-error').text('Short passwords are easy to guess. Try one with at least 4 characters.');
       $('#password').css('border','1px solid red');
  }
   
    return false;
  })
  

   $(this).submit(function() {
 
    var emailLogin = $('#emaillogin').val();
        if (emailLogin === "") {
          $('.email-login-error').text('Please enter your email.');
          $('#emaillogin').css('border','1px solid red');
        }
       
    return false;
  })


  $(this).submit(function() {
 
    var passwordLogin = $('#passwordlogin').val();
        if (passwordLogin === "") {
          $('.password-login-error').text('Please enter your password.');
          $('#passwordlogin').css('border','1px solid red');
        }
     
   
    return false;
  })


  
}

$(document).ready(main);