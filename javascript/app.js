// Collection of helpers

// Write out contact line
function get_contact_sig() {
  document.write(get_contact_email() );
}

// Hide email address a bit
function get_contact_email() {
   var a = "mike";
   var b = "graysky";
   var c = ".org";
   return "<a href=mailto:"+a+"@"+b+c+">"+a+"@"+b+c+"</a>";
}

// Hide email address a bit
function get_contact_email_link() {
   var a = "mike";
   var b = "graysky";
   var c = ".org";
   return "<a href=mailto:"+a+"@"+b+c+">";
}

// Pic a random picture
function pic_thumbnail() {
	var pics = new Array();
	pics[0] = "/images/thumbnails/charles_t.jpg";
	pics[1] = "/images/thumbnails/mit_dorm.jpg";
	pics[2] = "/images/thumbnails/macallen_building.jpg";
	var choice = Math.floor(Math.random() * pics.length);
	var img_tag = "<img src=" + pics[choice] + " style='border: 1px solid black;'>";
	document.write(img_tag);
}