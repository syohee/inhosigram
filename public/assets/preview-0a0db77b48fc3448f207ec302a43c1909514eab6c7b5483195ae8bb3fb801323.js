$(function(){$("#image_upload").off().change(function(){if(this.files&&this.files[0]){var e=new FileReader;e.onload=function(e){$(".preview_image").html('<img src="'+e.target.result+'">')},e.readAsDataURL(this.files[0])}})});