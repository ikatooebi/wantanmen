// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content, target) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(target).append(content.replace(regexp, new_id));
}
window.onload = function(){
	for (i = 0; i < 99; i++) {
		a = "user_addresses_attributes_" + i + "__destroy";
		b = "user_addresses_attributes_" + i + "_prefecture"
		if(document.getElementById(a).value == "true"){
			//document.getElementById(b).style.display = "none";
			if (document.getElementById(a).parentNode){
				document.getElementById(a).parentNode.style.display= "none";
			} else {
				i = 99;
			}
		}
	}
}
