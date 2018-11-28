
// fluidvid.js - makes iframes with added class .fluid-frame behave resposive/resizeable to it's parent, mantains aspect ratio.

(function ( window, document, undefined ) {

  /*
   * Grab all iframes on the page or return
   */
  var iframes = document.getElementsByClassName("fluid-frame");

  /*
   * Loop through the iframes array
   */
  for ( var i = 0; i < iframes.length; i++ ) {

    var iframe = iframes[i],

    /*
       * RegExp, extend this if you need more players
       */
    players = /www.youtube.com|player.vimeo.com/;

    /*
     * If the RegExp pattern exists within the current iframe
     */
    if ( iframe.src.search( players ) > 0 ) {

      /*
       * Calculate the video ratio based on the iframe's w/h dimensions
       */
      var videoRatio        = ( iframe.height / iframe.width ) * 100;
      
      /*
       * Replace the iframe's dimensions and position
       * the iframe absolute, this is the trick to emulate
       * the video ratio
       */
      iframe.style.position = 'absolute';
      iframe.style.top      = '0';
      iframe.style.left     = '0';
      iframe.width          = '100%';
      iframe.height         = '100%';
      
      /*
       * Wrap the iframe in a new <div> which uses a
       * dynamically fetched padding-top property based
       * on the video's w/h dimensions
       */
      var wrap              = document.createElement( 'div' );
      wrap.className        = 'fluid-vids';
      wrap.style.width      = '100%';
      wrap.style.position   = 'relative';
      wrap.style.paddingTop = videoRatio + '%';
      
      /*
       * Add the iframe inside our newly created <div>
       */
      var iframeParent      = iframe.parentNode;
      iframeParent.insertBefore( wrap, iframe );
      wrap.appendChild( iframe );

    }

  }

})( window, document );


$(function() {

$("#sidebar-menu .menu-item-has-children").children(".sub-menu").before("<a class='expand closed-sub-m' href='javascript:void(0)'></a>");

      // open / close sidebar ( Menu button )


    $('#mobile-menu-btn').click(function (e) {

		e.stopPropagation();

		$('#sidebar-menu').toggleClass("showSideAction");

		$('#navbar-corner').toggleClass("open");

		$('#sidebar-menu').click(function (event) {

			event.stopPropagation();

			});

	});	

	



$('html').click(function () {

    $('#sidebar-menu').removeClass('showSideAction');

	$('#navbar-corner').removeClass('open');

});

 var ix = -1;

 

$('#sidebar-menu li').click(function () {

   ix++;

	 if (ix == 0) {

	$(this).find('a.expand').toggleClass('closed-sub-m');

	$(this).children('.sub-menu').toggleClass('open').slideToggle();

	

} else {

	$(this).find('a.expand').toggleClass('closed-sub-m');

	$(this).children('.sub-menu').toggleClass('open').slideToggle();

	$(this).siblings().children('.open').toggleClass('open').slideToggle().siblings('.expand').toggleClass('closed-sub-m');

	}

});

});


$(function(){
    jQuery('img.svg').each(function(){
        var $img = jQuery(this);
        var imgID = $img.attr('id');
        var imgClass = $img.attr('class');
        var imgURL = $img.attr('src');
    
        jQuery.get(imgURL, function(data) {
            // Get the SVG tag, ignore the rest
            var $svg = jQuery(data).find('svg');
    
            // Add replaced image's ID to the new SVG
            if(typeof imgID !== 'undefined') {
                $svg = $svg.attr('id', imgID);
            }
            // Add replaced image's classes to the new SVG
            if(typeof imgClass !== 'undefined') {
                $svg = $svg.attr('class', imgClass+' replaced-svg');
            }
    
            // Remove any invalid XML tags as per http://validator.w3.org
            $svg = $svg.removeAttr('xmlns:a');
            
            // Check if the viewport is set, else we gonna set it if we can.
            if(!$svg.attr('viewBox') && $svg.attr('height') && $svg.attr('width')) {
                $svg.attr('viewBox', '0 0 ' + $svg.attr('height') + ' ' + $svg.attr('width'))
            }
    
            // Replace image with new SVG
            $img.replaceWith($svg);
    
        }, 'xml');
    
    });
});

// add all ready events here

$(document).ready(function() {
console.log('ready');








$( "#sidebar-menu" ).append( "<li id='ceres_log_sidebar' class='menu-item menu-item-type-custom menu-item-object-custom'><a href='javascript:void(0);'>SIGN UP</a></li>" );



 $("div.lazy").lazyload({
      effect : "fadeIn"
  });


var is_root = location.pathname == "/";
// Get the modal
var modal = document.getElementById('SignupModal');

var modal2 = document.getElementById('SearchModal');

// Get the button that opens the modal
var btn = document.getElementById("ceres_log");

var btn2 = document.getElementById("ceres_log_sidebar");



String.prototype.urlParamValue = function() {
    var desiredVal = null;
    var paramName = this.valueOf();
    window.location.search.substring(1).split('&').some(function(currentValue, _, _) {
        var nameVal = currentValue.split('=');
        if ( decodeURIComponent(nameVal[0]) === paramName ) {
            desiredVal = decodeURIComponent(nameVal[1]);
            return true;
        }
        return false;
    });
    return desiredVal;
};

var paramVal = "signup".urlParamValue();

if (paramVal) { if ( paramVal === 'y' ) { modal.style.display = "block"; } };


if ( is_root === true ) {

console.log('root');

var btn4 = document.getElementById("ceres_home_block");

btn4.onclick = function() {
    modal.style.display = "block";
}

};


var btn3 = document.getElementById("search-i");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

var span2 = document.getElementsByClassName("close-s")[0];

// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

btn2.onclick = function() {
    modal.style.display = "block";
}



btn3.onclick = function() {
    modal2.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

span2.onclick = function() {
    modal2.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }

        if (event.target == modal2) {
        modal2.style.display = "none";
    }


}


});

// add all on load here

window.onload = function() {

console.log('load');

if ($("body").hasClass("single-post")) {
 

  var windw = this;
  var articleH = $("article.post").height();
  var heroH = $(".hero-blog").height();
  var scrollBottom = $(window).height() - 75;

$.fn.followTo = function ( pos ) {
    var $this = this,
        $window = $(windw);
    

    $window.scroll(function(e){
      console.log(pos);
      console.log($window.scrollTop());
        if ($window.scrollTop() > pos) {
            $this.css({
                position: 'relative',
                bottom: 0
            });
        } else {

             if ($window.scrollTop() < heroH) {


                 $this.css({
                    position: 'relative',
                    bottom: 0
                });

             } else {

                 $this.css({
                    position: 'fixed',
                    bottom: 25
                });
             }

        }
    });
};

$('.ssba-wrap').followTo(articleH + heroH - scrollBottom);


}


};