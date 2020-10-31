<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Croppie demo</title>
<meta name="viewport" content="width=device-width, initial-scale=0.5">
<link rel="stylesheet" href="./resources/croppie/croppie.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="./resources/croppie/croppie.js"></script>
<style>
body {
	padding: 10px;
}
.croppie-container {
	padding: 0;
	max-width: 250px; .
	cr-slider-wrap {margin-top: 10px;
	margin-bottom: 20px;
}

}
.yingsLightBox.dialog--open .dialog__content {
	min-width: 250px;
	min-height: 350px;
	max-height: none;
}

.croppedImage {
	margin: 0 auto 20px;
	max-width: 250px;
}

.contentImage__img {
	margin-bottom: 20px;
	max-width: 250px
}

.contentImage__container { > span { display:-webkit-flex;
	display: flex;
	justify-content: center;
	align-items: center; $
	diameter: 120px;
	width: $diameter;
	height: $diameter;
	border-radius: 50%;
	background: rgba(#fff, .9);
	border: 1px solid #ddd;
	line-height: 1.2;
	position: absolute;
	top: 25%;
	left: 25%; > span { padding : 15px;
	font-weight: bold;
	text-align: center;
	text-transform: uppercase;
}

}
}
.actionSelectFile, .actionDone, .actionUpload, .actionCrop {
	display: block;
	width: 250px;
	text-align: center;
	background: #AB308A;
	border-radius: 3px;
	font-family: $ fancySansSerif;
	font-weight: 700;
	font-size: 13px;
	color: #fff;
	border: 1px solid #AB308A;
	padding: 8px 20px;
	text-decoration: none;
	text-transform: uppercase;
	line-height: 1.5;
	margin: 0 auto 10px;
	&:
	hover
	{
	text-decoration
	:
	none;
}

}
.actionCancel {
	display: block;
	width: 250px;
	text-align: center;
	background: #f5f5f5;
	border-radius: 3px;
	font-family: $ fancySansSerif;
	font-weight: 700;
	font-size: 13px;
	color: #AB308A;
	border: 1px solid #ddd;
	padding: 8px 20px;
	text-decoration: none;
	text-transform: uppercase;
	line-height: 1.5;
	margin: 0 auto 10px;
	&:
	hover
	{
	text-decoration
	:
	none;
}

}
input[type="file"] {
	display: none;
}
</style>


<script type="text/javascript">
/* Open initial modal */
$('.userActivity__didButton').on('click', function(event){
  event.preventDefault();
  this.pictureUrl = 'http://images.meredith.com/content/dam/bhg/Images/2013/6/13/RU204832.jpg.rendition.largest.ss.jpg';
  this.picture = $("#initialModal img");
  this.picture.attr('src', this.pictureUrl);
  $("#initialModal").yingsLightBox({clickOverlayToClose: false});
  $('#main-cropper').croppie('bind');
})

/* Close Modal Buttons */  
$('.actionDone').on('click', function(e) {
  $('#initialModal').yingsLightBox().closeModal();
});
$('.actionCancel').on('click', function(e) {
  $('#croppingModal').yingsLightBox().closeModal();
  $('#finalizeModal').yingsLightBox().closeModal();
  $uploadCroppedPhoto.croppie.destroy();
});  
$('.actionUpload').on('click', function(e) {
  $('#finalizeModal').yingsLightBox().closeModal();
  $uploadCroppedPhoto.croppie.destroy();
  alert("Yay! Your image has been uploaded!");
});

/* File selected triggers second modal */
$('input[type="file"]').change(function(){
$('#initialModal').yingsLightBox().closeModal();
$("#croppingModal").yingsLightBox({clickOverlayToClose: false});
readFile(this);
});  

/* Croppie Code */
var $uploadCroppedPhoto
$uploadCroppedPhoto = $('#main-cropper').croppie({
  viewport: { width: 250, height: 250 },
  boundary: { width: 250, height: 350 },
  showZoomer: true
});

/* Send selected file to Croppie */
function readFile(input) {
if (input.files && input.files[0]) {
  var reader = new FileReader();

  reader.onload = function (e) {
    var img = new Image;
    img.onload = function() {
      if(img.height < 600|| img.width < 600){
        console.debug("too small!");
      } else {
        $('#main-cropper').croppie('setZoom', 1.0);
        $('#main-cropper').croppie('bind', {
          url: e.target.result
        });
      }
    };
    img.src = reader.result;
  }

  reader.readAsDataURL(input.files[0]);
}
}

/* Send crop to preview modal */
$('.actionCrop').on('click', function (ev) {
			$uploadCroppedPhoto.croppie('result', {
				type: 'canvas',
      format: 'jpeg',
				size: {width:600, height:600}
			}).then(function (resp) {
      $('#croppingModal').yingsLightBox().closeModal();
      this.picture = $("#finalizeModal img");
      this.picture.attr('src', resp);
      $("#finalizeModal").yingsLightBox({clickOverlayToClose: false});
			});
		});
</script>

</head>
<body>
	<a class="userActivity__didButton"></a>
	<div id="initialModal" class="yingsLightBox">
		<div class="dialog__overlay"></div>
		<div class="dialog__content">
			<div class="contentImage__container">
				<img src="" alt="" class="contentImage__img" /> <span><span>I
						Did It!</span></span>
			</div>
			<label class="actionSelectFile" for="upload"> <span>Add
					My Photo</span> <input type="file" id="upload" value="Choose Image"
				accept="image/*">
			</label> <a class="actionDone">Done</a> <a class="close">close</a>
		</div>
	</div>
	<div id="croppingModal" class="yingsLightBox">
		<div class="dialog__overlay"></div>
		<div class="dialog__content">
			<div id="main-cropper"></div>
			<a class="actionCrop">Choose</a> <a class="actionCancel">Cancel</a> <a
				class="close">close</a>
		</div>
	</div>
	<div id="finalizeModal" class="yingsLightBox">
		<div class="dialog__overlay"></div>
		<div class="dialog__content">
			<img src="" alt="" class="croppedImage" /> <a class="actionUpload">Done</a>
			<a class="actionCancel">Cancel</a> <a class="close">close</a>
		</div>
	</div>
</body>
</html>