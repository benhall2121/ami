// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	
  $('.page_nav_link').click(function(){
    checkSelectedTab('page_nav_link', $(this));
  });

  //************************* FAQS  *************************

	$('.faq_question').live('click', function(){
	  $(this).siblings('.faq_answer').slideToggle('fast');
	});
		
  //************************* END FAQS  *************************

  var video_id = 0;
  //
 
    //Submit Email
	$("#email_submit").live('click',function(){
	  var to = $('#email_to_id').val();
	  var from = $('#email_from_id').val();
	  var subject = $('#email_subject_id').val();
	  var message = $('#email_message_id').val();
	  var cc = $('#email_cc').is(':checked');
	  $('#email_text_message').html('');
      
	  if(to == '' || from == '' || subject == '' || message == ''){
		alert("All fields are required. Please fill out the rest of the form");
		return false;      
	  }
      
	  $.post('/emails/add_email', {"email": {"to": to, "from": from, "subject": subject, "message": message}}, null);
		  
	  $('#email_from_id').val('');
	  $('#email_subject_id').val('');
	  $('#email_message_id').val('');
	  $('#email_cc').attr('checked', false);
	  $('#email_text_message').html('Thank You! Your message has been sent!');
		  
    });
  
	//Cancel Email
	$("#email_cancel").live('click',function(){
	  $('#email_from_id').val('');
	  $('#email_subject_id').val('');
	  $('#email_message_id').val('');
      $('#email_text_message').html('');
	  $('#email_cc').attr('checked', false);
	});

	$(".description_type").live('change', function(){
		current_val = $(this).val();
		parent_div = $(this).parent();
		//Picture Upload Div
		picture_upload_div = parent_div.siblings('.upload_field');
		//Video Url Div
		video_url_div = parent_div.siblings('.url_field');

		if(current_val == 'video'){
		  picture_upload_div.hide();
		  video_url_div.show();
		} else if(current_val == 'picture'){
		  picture_upload_div.show();
		  video_url_div.hide();
		} else {
		  picture_upload_div.hide();
		  video_url_div.hide();
		}
	});

	$(".photoIconUpload").live('click', function(){
	  var photo_field = $(this).parent().parent().parent().find('.upload_content_field');
	  var file_to_set = $(this).parent().parent().parent().parent().parent().find('.file_name');
	  
	  if(file_to_set.attr('id') == undefined){
	  	photo_field.attr('id', 'photo' + video_id )
	    file_to_set.attr('id', 'filephoto' + video_id);
	    video_id += 1;
	  }

	  photo_field.click();
	});

	$('.videoIconUpload').live('click', function(){
		var div_to_open = $(this).parent().parent().parent().parent().parent().find('.video_div');
		var a_to_set = $(this).parent().parent().parent().find('.videovideo');
		var file_to_set = $(this).parent().parent().parent().parent().parent().find('.file_name');

	  if(div_to_open.attr('id') == undefined){
		var fancy_id = 'video' + video_id;
		div_to_open.attr('id', fancy_id);
		var a_fancy_id = 'videovideo' + video_id;
		a_to_set.attr('id', a_fancy_id);
		file_to_set.attr('id', 'filevideo' + video_id);
	  	video_id += 1;
	  } else {
	  	var fancy_id = div_to_open.attr('id');
	  	var a_fancy_id = a_to_set.attr('id');
	  }

	  	$('#' + a_fancy_id).fancybox({
	  		'href': '#' + fancy_id
	  	}).trigger('click');
	});

	$('.submitVideoButton').live('click', function(){
		youtube_url = $(this).parent().find('.description_url').val();

		// Validate it is a video
		if(!validateMyURL(youtube_url, ['youtube', 'youtu.be'], ['?v='])) {
  		  alert("invalid url");
  		  return false;
		}
		// End Validation

		var video_code = getMyParameterByName(youtube_url, "v");

		video_div_id = $(this).parent().attr('id');
		$('#video' + video_div_id).parent().find('.description_type').val('video');
		$('#video' + video_div_id).parent().find('.video_code').val(video_code);
		$('#file' + video_div_id).html(youtube_url);
		$.fancybox.close();
	})

	$('input.upload_content_field').live('change', function(e){
  		in2 = $(this).val();
  		this_id = $(this).attr('id');
	    $(this).parent().find('.description_type').val('photo');
	    $('#file' + this_id).html(in2);
	});


    $("#startups th a, #startups .pagination a").live("click", function() {
      $.getScript(this.href);
      return false;
    });

    $("#startups_search input").keyup(function() {
      $.get($("#startups_search").attr("action"), 
      $("#startups_search").serialize(), null, "script");
      return false;
    });

    $(".donateButton").live('click', function(){

      var other=false;

      //If the user is not a contributor, they can not donate money
      if($('#is_contributor').val() == 'false'){
      	alert("In order to donate, Please login as a contributor.");
      	return false;
      }

      //Transaction Fields
      startup_id = $('#startup_id').val();
      donate_amount = $('#donate_amount').val();

      //If the Amount drop down is other grab the amount from the text field
      if(donate_amount == 'Other'){
      	donate_amount = $('#other_amount_field').val();
      	other = true;
      }

      //If the amount is nothing don't let the donation to go through
      if(donate_amount == ''){
      	alert("Please Select an Amount to Donate.");
      	return false;
      }

      var current_href = $(this).attr('href');
      var new_href = current_href + '&transaction[amount]=' + donate_amount + '&other=' + other;

      $(this).attr('href', new_href);

      //Send the Donation
     /* $.post('/transactions/new_transaction', {"transaction": {"amount": donate_amount, "startup_id": startup_id, "transaction_type": "donation"}}, null);

      alert("Thanks for donating. You are AWESOME!");

      var amount_to_go = unFormat($('#amount_to_go').html());
      var total_raised = unFormat($('#total_raised').html());


      var new_amount_to_go = amount_to_go-parseFloat(donate_amount);
      var new_total_raised = total_raised+parseFloat(donate_amount);
      var new_percentage = (parseFloat(new_total_raised/(amount_to_go+total_raised)).toFixed(2))*100;

      $('#amount_to_go').html(formatCurrency(new_amount_to_go));
      $('#total_raised').html(formatCurrency(new_total_raised));
      $('#percentage_display').html(formatPercentage(new_percentage));
*/
    });

	
    $('#other_amount_field').keyup(function(){
      var unformatedValue = unFormat($(this).val());
      $(this).val(unformatedValue);
      $('#transaction_amount').val(parseFloat(unformatedValue).toFixed(2));
      calc_transaction_totals();
    });

    $("#donate_amount").live('change', function(){
    	if($(this).val() == 'Other'){
    	  $('.other_amount').show();
    	} else {
    	  $('.other_amount').hide();
    	}
    });



});


// ********************  FUNCTIONS  ********************  
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".description_wrapper").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

function validateMyURL(textval, specific_url, specific_prameters) {
  var urlregex = new RegExp("^(http:\/\/www.|https:\/\/www.|ftp:\/\/www.|www.){1}([0-9A-Za-z]+\.)");
  var return_value = urlregex.test(textval);
  
  // Check for specific url
  if(specific_url && return_value){
  	$.each(specific_url, function(index, value){
  	  if(textval.indexOf(value) >= 0){
  	    return_value = true;
  	    return false;
  	  } else {
  	    return_value = false;
  	  }
  	});
  } 

  // Check for specific parameter
  if(specific_url && return_value){
  	$.each(specific_prameters, function(index, value){
  	  if(textval.indexOf(value) >= 0){
  	    return_value = true;
  	    return false;
  	  } else {
  	    return_value = false;
  	  }
  	});
  } 

  return return_value
}

function getMyParameterByName(url, name) {
    var match = RegExp('[?&]' + name + '=([^&]*)')
                    .exec(url);
    return match && decodeURIComponent(match[1].replace(/\+/g, ' '));
}

function formatCurrency(num) {

    if(num < 0 || !isNaN(num)){
    	num = num.toString();    
    }
    //remove everything but numbers and .	
    num = num.replace(/[^0-9.-]/g, '');
    //check if it is a valid number
    num = isNaN(num) || num === '' || num === null ? 0.00 : num;
    //set the number to two decimal places
    num = parseFloat(num).toFixed(2);
    //add $ and commas
    num = '$' + num.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"); 
    return num
}

function unFormat(num) {
  if(isNaN(num)){	
    if(num == ''){ num = '0'; }	
    //remove everything but numbers and .	
    num = num.replace(/[^\d.]/g, '');
  }
  return num
}

function formatPercentage(percent) {

    if(percent < 0 || !isNaN(percent)){
    	percent = percent.toString();    
    }
    //remove everything but numbers and .	
    percent = percent.replace(/[^0-9.]/g, '');
    //check if it is a valid number
    percent = isNaN(percent) || percent === '' || percent === null ? "0" : percent;
    //add % and commas
    percent = percent.replace(/(\d)(?=(\d{3})+(?!\d))/g, "%1,") + '%'; 
    return percent
}

function calc_transaction_totals(){
  var total = $('#transaction_amount').val();
  $('#total_amount').html(formatCurrency(total));
}

function checkSelectedTab(class_name, wow){

  $('.' + class_name).removeClass(class_name + '_selected');
  $('.' + class_name + '_content').hide();
  
  if(wow == ''){
    $('.' + class_name).first().addClass(class_name + '_selected');
    $('.' + class_name + '_content').first().show();
  } else {
    wow.addClass(class_name + '_selected');
    $('#' + class_name + '_' + wow.attr('id')).show();
  }
}



