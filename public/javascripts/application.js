// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function setHeight(name) {
   var content = document.getElementById(name);
   var h1 = parseFloat(content.offsetHeight)+12;
   document.getElementById(name+"_l").style.height = (h1) + 'px';
   document.getElementById(name+"_r").style.height = (h1) + 'px';
}

function setHeightAll(){
	setHeight("content");
	setHeight("content_cont");

}

function fixPNG(element)
{
  if (/MSIE (5\.5|6).+Win/.test(navigator.userAgent))
  {
    var src;
    if (element.tagName=='IMG')
    {
      if (/\.png$/.test(element.src))
      {
        src = element.src;
        element.src = "image/blank.gif";
      }
    }
    else
    {

      src = element.currentStyle.backgroundImage.match(/url\("(.+\.png)"\)/i);
      if (src)
      {
        src = src[1];
        element.runtimeStyle.backgroundImage="none";
      }
    }
    if (src) element.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "',sizingMethod='scale')";
  }
}

var browser_name = navigator.appName;
var browser_version = parseFloat(navigator.appVersion);
ie=false;
if (browser_name=="Microsoft Internet Explorer") ie=true;

$(document).ready(function(){
	//$(".top_img").hide();
	//$("#top_img2").fadeIn(3000, function(){$(this).fadeOut(3000);});
        
	$("#top_imgs").cycle({
		fx:'fade',
		speed: 2000,
		pause:1});
	// --------------- TABS -------------------
	$("#content_menu > ul").tabs({
		fxFade: true,
		fxSpeed: 'slow'
	});

	$("#content_menu > ul > li").hover(function(){$(this).attr({style:"cursor:pointer;"})},function(){$(this).attr({style:"cursor:default;"})});
	$("#but1").click(function(){$("#link_to_page_1").trigger("click")});
	$("#but2").click(function(){$("#link_to_page_2").trigger("click")});
	$("#but1").click(function(){$("#link_to_page_3").trigger("click")});

	$("#content_menu > ul > li > a").click(function(){
		$("#link_to_page_1").parent().removeClass("but1_on");
		$("#link_to_page_2").parent().removeClass("but2_on");
		$("#link_to_page_3").parent().removeClass("but3_on");
		$(this).parent().addClass($(this).parent().attr("id")+"_on");
		if (ie) setHeightAll();
		//setHeight("content_cont");
		//$("#content_menu > ul > li").attr({class:"but"});
	 });
	$("#link_to_page_1").trigger("click");
	// --------------- TABS -------------------
});


$(document).ready(function(){
    $(".toggle_link_change").click(function(){$(this).next(".toggle_div").toggle("fast", function(){setHeightAll();}); if ($(this).text()=="Read more") {$(this).text("Hide");} else {$(this).text("Read more")}  return false});
    $(".toggle_button").click(function(){$(this).next(".toggle_div").toggle("fast", function(){setHeightAll();}); if ($(this).find("img").attr({src:'/images/max_ico.gif'})) {$(this).find("img").attr({src:'/images/min_ico.gif'});} else {$(this).find("img").attr({src:'/images/max_ico.gif'})}  return false});
    $(".toggle_div").toggle();
    $(".toggle_div_display").toggle(); // показывает див, скрытый вышеидущей командой, используется например в списке стран
    $(".toggle_link").click(function(){$(this).parent().find(".toggle_div").toggle("fast",function(){setHeightAll();});   return false});
});

