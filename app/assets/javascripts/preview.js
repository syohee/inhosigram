/* global $ */
$(function(){
  $('#image_upload').off().change(function(){
    if (this.files && this.files[0]){
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.preview_image').html('<img src="' + e.target.result + '">');
      }
      reader.readAsDataURL(this.files[0]);
    }
  });
})