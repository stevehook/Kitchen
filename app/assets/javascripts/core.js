$(function() {
  var carouselChangeHandler = function() {
  }
  var menuChangeHandler = function() {
  }
  window.menu = $('#menu').menu();
  window.carousel = $('#carousel').carousel();
});

(function($) {
  var defaults = {};
  $.fn.menu = function(options) {
    var opts = $.extend({}, defaults, options);
    return this.each(function() 
    {
      if (this.menu) { return false; }
      var self = { 
        initialize: function()
        {
          var section = $('body').data('section');
          var menuItem = $("a[data-section='" + section + "']");
          menuItem.addClass('selected');
        }
      };
      this.menu = self;
      self.initialize();
    });
    return this;
  };
})(jQuery);

(function($) {
  var defaults = { width : 960 };
  $.fn.carousel = function(options) {
    var opts = $.extend({}, defaults, options);
    return this.each(function() {
      // this represents the carousel DOM object, i.e. the div with id '#carousel' in our case
      // $this is just a jQuery wrapper around this (just a naming convention)
      var $this = $(this);
      if (this.carousel) { return false; }
      var self = {
        isAnimating: false,
        initialize: function() {
          this.currentPanel = $('.carouselItem:first', $this);
          $(window).resize(function() { self.onResize(); });
          this.onResize();
          this.currentPanel.show();
          // make sure carousel only works if you have atleast 2 items
          if ($('#carousel .carouselItem').length < 2) {
            return;
          }
          $("<a class='carouselButton left'>&lt;</a>").appendTo($this).click(function(){
            if (!self.isAnimating) {
              // de-activate the buttons whilst the animation is in progress
              self.isAnimating = true;
              self.showPrevious();
            }
          });
          $("<a class='carouselButton right'>&gt;</a>").appendTo($this).click(function(){
            if (!self.isAnimating) {
              self.isAnimating = true;
              self.showNext();
            }
          });
        },
        onResize: function() {
           // Need to set the width of the carousel and position it so that it occupies full width
          this.bodyWidth = $('body').width();
          this.bodyHeight = $('body').height();
          $this.width(this.bodyWidth);
          $this.height(this.bodyHeight);
          $('.carouselItem', $this).width(this.bodyWidth);
          $('.carouselItem', $this).height(this.bodyHeight);
          //this.margin = Math.max(0, (this.bodyWidth - opts.width)/2);
        },
        showPrevious: function() {
          if (this.currentPanel.prev('.carouselItem').length > 0) {
            this.setCurrent(this.currentPanel.prev('.carouselItem'), 'left');
          } else {
            this.setCurrent($('.carouselItem:last', $this), 'left');
          }
        },
        showNext: function() {
          if (this.currentPanel.next('.carouselItem').length > 0) {
            this.setCurrent(this.currentPanel.next('.carouselItem'), 'right');
          } else {
            this.setCurrent($('.carouselItem:first', $this), 'right');
          } 
        },
        setCurrent: function(newCurrent, direction) {
          var oldPanel = this.currentPanel;
          this.currentPanel = newCurrent;
          var startLeft = direction == 'left' ? this.bodyWidth : (this.bodyWidth * (-1));
          this.currentPanel.css({ left: startLeft + 'px' });

          // here 'this' is the object that we have assigned to the 'self' vairable above
          this.currentPanel.show();
          this.currentPanel.animate({ left: '0px' }, 700, function() {
            // reactivate the buttons
            self.isAnimating = false;
          });

          var endLeft = (startLeft * (-1));
          oldPanel.animate({ left:  endLeft + 'px' }, 700, function() {
            // in this callback 'this' would be the currentPanel DOM object
            // reset to the original position
            oldPanel.hide();
            oldPanel.css({ left: '0px' });
          });
        }
      };
      this.carousel = self;
      self.initialize();      
      return this;
    });
  };

})(jQuery);
