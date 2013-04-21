// Set the minimum height of parallax panels to window height
$(function() {
  var callback = function() {
    $('.parallaxPanel').css({ 'min-height': window.innerHeight + 'px' });
    $('#homePanel').css({ 'min-height': (window.innerHeight - 102) + 'px' });
    $('.recipeContainer').css({ 'min-height': (window.innerHeight) + 'px' });
  };
  $(window).resize(callback);
  callback();
});

$(function() {
  var carouselChangeHandler = function() {
  }
  var menuChangeHandler = function() {
  }
  window.menu = $('#menu').homeMenu();
  window.carousel = $('#carousel').carousel();
  $('.markdownInplaceEditor').markdownInplaceEditor();
  $('#parallax').parallax();
  $('.dotNav ul').photoScroller();
  // $('.watermark').watermark();
});

// Override menu anchor links so that the page scrolls slowly to the correct panel
$(function() {
  $('#menu li a, .parallaxDownButton a').click(function(e) {
    var $this = $(this);
    if (/#/.test($this.attr('href')) && window.location.pathname === '/') {
      var match = /#(.+)/.exec($this.attr('href'));
      if (match) {
        var $target = $('#' + match[1]);
        var offset = $target.offset();
        $('html, body').animate({
          scrollTop: offset.top,
          scrollLeft: offset.left
        }, 1000);
        _gaq.push(['_trackEvent', 'MainMenu', match[1]]);
        e.preventDefault();
      }
    }
  });
});

// GoogleAnalytics
$(function() {
  $('.tellMeMore').click(function() {
    $this = $(this);
    _gaq.push(['_trackEvent', 'TellMeMore', $this.data('feedback')]);
  });
});

$(function() {
  $('input#search').autocomplete({
    source: '/recipes/lookup',
    minLength: 2
  });
  $("input[type='radio']").change(function() {
    $(this).closest("form").submit();
  });
});

// Plugin for photo browser on recipe#show page
(function($) {
  var defaults = {};
  $.fn.photoScroller = function(options) {
    var opts = $.extend({}, defaults, options);
    return this.each(function() {
      var $ul = $(this);
      if (this.photoScroller) { return false; }
      var self = {
        initialize: function() {
          $('#recipePhotoImage').click(function(e) {
            self.suspendTimer();
            self.scroll();
          });
          $('a', $ul).click(function(e) {
            self.suspendTimer();
            self.scroll($(this));
            e.preventDefault();
          });
          self.runTimer();
        },
        suspendTimer: function() {
          self.timerSuspended = true;
        },
        runTimer: function() {
          setTimeout(function() {
            if (self.timerSuspended) { return; }
            self.scroll();
            self.runTimer();
          }, 5000);
        },
        nextItem: function() {
          var currentSelectedListItem = $('a.filledDot', $ul).parent();
          var nextListItem = currentSelectedListItem.next()[0] || $('li', $ul)[0];
          return $('a', nextListItem);
        },
        scroll: function(nextItem) {
          var $nextItem = nextItem || self.nextItem();
          var imageCopy = $("<img id='recipeImageCopy' src='" + $('a.filledDot', $ul).data('image-url') + "'></img>");
          $('#recipeImageContainer').append(imageCopy);

          $('#recipePhotoImage').attr('src', $nextItem.data('image-url'));

          // preventDefault to avoid scrolling to the top of the browser every time a link is clicked.
          $('a', $ul).addClass('emptyDot').removeClass('filledDot');
          $nextItem.addClass('filledDot');

          // Fade out the copy and delete when we are done
          imageCopy.animate({
            opacity: 0,
          }, 1000, function() {
            imageCopy.remove();
          });
        }
      };
      this.photoScroller = self;
      self.initialize();
    });
    return this;
  };
})(jQuery);

$(function() {
  var $banner = $('#banner');
  var bannerOffset = $banner[0].offsetTop;
  var callback = function(event) {
    var offset = $(window).scrollTop();
    if ($('#header').length == 0 || offset > bannerOffset) {
      $banner.addClass('fixed');
    } else {
      $banner.removeClass('fixed');
    }
  }
  $(document).scroll(callback);
  callback();
});

// Plugin for menu
(function($) {
  var defaults = {};
  $.fn.homeMenu = function(options) {
    var opts = $.extend({}, defaults, options);
    return this.each(function() {
      if (this.homeMenu) { return false; }
      var self = {
        initialize: function() {
          var section = $('body').data('section');
          var menu = $('#menu');
          var menuItem = $("a[data-section='" + section + "']");
          menuItem.addClass('selected');

          var searchMenuItem = $('.searchMenuItem');
          var searchMenuIcon = $('.search_menu_item');
          var searchBox = $('#search', searchMenuItem);
          searchMenuIcon.mouseenter(function(e) {
            $('.hidden', searchMenuItem).animate({ opacity: 1 });
            $('#search', searchMenuItem).focus();
          });
          searchMenuIcon.click(function(e) {
            searchBox.focus();
            if (searchBox.val() !== '') {
              searchBox.closest('form').submit();
            }
          });
          searchBox.blur(function() {
            setTimeout(function() {
              if (!$('.hidden', searchMenuItem).is(':focus')) {
                $('.hidden', searchMenuItem).animate({ opacity: 0 });
              }
            }, 500);
          });
          if ($('.parallaxPanel').length > 0) {
            $(document).scroll(function(event) {
              var panel = self.getActivePanel();
              $("a", menu).removeClass('selected');
              var panelId = panel[0].id;
              if (panelId == 'homePanel') { panelId = 'header'; }
              $("a[href='/#" + panelId + "']").addClass('selected');
            });
          }
        },
        getActivePanel: function() {
          $window = $(window);
          var scrollTop = $window.scrollTop();
          var height = $window.height();
          var $panels = $('.parallaxPanel');
          var $activePanel = null;
          $panels.each(function(index, panel) {
            $panel = $(panel);
            var offsetTop = $panel.offset().top;
            if (offsetTop >= (scrollTop - (height/2)) && offsetTop < (scrollTop + (height/2))) {
              $activePanel = $panel;
              return false;
            }
          });
          return $activePanel || $panels.first();
        }
      };
      this.homeMenu = self;
      self.initialize();
    });
    return this;
  };
})(jQuery);


// Plugin for watermark
(function($) {
  var defaults = {};
  $.fn.watermark = function(options) {
    var opts = $.extend({}, defaults, options);
    return this.each(function() {
      if (this.watermark) { return false; }
      var $this = $(this);
      watermarkText = $this.data('watermark-text');
      $this.val(watermarkText);
      var self = {
        initialize: function() {
          $this.focus(function() {
            $this.removeClass('watermark');
            if ($this.val() != watermarkText) {
              $this.val($this.val());
            }
            else if ($this.val() == '') {
              $this.val(watermarkText);
            } else {
              $this.val('');
            }
          });
          $this.blur(function() {
            if ($this.val() == '') {
              $this.addClass('watermark');
              $this.val(watermarkText);
            }
          });
          $this.closest('form').submit(function(e) {
            if ($this.val() == watermarkText) {
              e.preventDefault();
              return false;
            }
          });
        }
      };
      this.watermark = self;
      self.initialize();
    });
    return this;
  };
})(jQuery);


// Plugin for Carousel
(function($) {
  var defaults = { width : 1200 };
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
          this.location = '/';
          this.panels = {}
          $('.carouselItem').each(function(index, panel) {
            $panel = $(panel);
            self.panels['/' + ($panel.data('content') || '')] = $panel;
          });
          this.currentPanel = $('.carouselItem:first', $this);
          this.currentPanel.show();
          // make sure carousel only works if you have at least 2 items
          if ($('#carousel .carouselItem').length < 2) {
            return;
          }
          $("<a class='carouselButton left'><span class='icon-angle-left icon'></span></a>").appendTo($this).click(function(){
            if (!self.isAnimating) {
              // de-activate the buttons whilst the animation is in progress
              self.isAnimating = true;
              self.showPrevious();
            }
          });
          $("<a class='carouselButton right'><span class='icon-angle-right icon'></span></a>").appendTo($this).click(function(){
            if (!self.isAnimating) {
              self.isAnimating = true;
              self.showNext();
            }
          });
          $(document).keydown(self.handleKey);
        },
        // This is to allow carousel navigation using keyboard
        handleKey: function(e) {
          if (self.buttonsVisible()) {
            //Find out what key was pressed
            // if its the left key/right key move the carousel otherwise do nothing
            if (e.which == 37) {
              self.ifNotAnimating(self.showPrevious);
              return false;
            } else if (e.which == 39) {
              self.ifNotAnimating(self.showNext);
              return false;
            }
          }
        },
        ifNotAnimating: function(callback) {
          if (!self.isAnimating) {
            self.isAnimating = true;
            // Call the callback in the context of self
            callback.call(self);
          }
        },
        buttonsVisible: function() {
          // return true iff the carousel buttons are visible (using window scrollOffset)
          var buttonOffset = $('.carouselButton').offset().top;
          var windowHeight = $(window).height();
          var scrollTop = $(window).scrollTop();
          return ((scrollTop + windowHeight) > buttonOffset && scrollTop < buttonOffset);
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
          var startLeft = direction == 'left' ? opts.width : (opts.width * (-1));
          this.currentPanel.css({ left: startLeft + 'px' });
          // here 'this' is the object that we have assigned to the 'self' variable above
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


// Plugin for markdown inplace editing
(function($) {
  var defaults = {};
  $.fn.markdownInplaceEditor = function(options) {
    var opts = $.extend({}, defaults, options);
    return this.each(function()
    {
      var $this = $(this);
      if (this.markdownInplaceEditor) { return false; }
      var self = {
        initialize: function() {
          self.container = $this;
          self.a = $('a', $this).click(self.onEditClick);
          self.textarea = $('textarea', $this);
          self.div = $('div', $this);
          self.textarea.blur(self.onBlur);
          self.dataUrl = self.container.data('url');
          self.dataClass = self.container.data('class');
          self.dataAttribute = self.container.data('attribute');
          self.startPreviewTimer();
        },
        onEditClick: function(event) {
          self.textarea.show().focus();
          self.a.hide();
        },
        onBlur: function(event) {
          self.a.show();
          self.textarea.hide();
          // Added 'put' as rails framework understands RESTful routes
          var params = { _method: 'put' };
          params[self.dataClass + '[' + self.dataAttribute + ']'] = self.textarea.val();
          $.post(self.dataUrl,
            params,
            function(data) {
              self.div.html(markdown.toHTML(self.textarea.val()));
          });
        },
        checkForChanges: function() {
          var currentValue = self.textarea.val();
          if (self.originalValue != currentValue) {
            self.originalValue = currentValue;
            self.div.html(markdown.toHTML(self.textarea.val()));
          }
        },
        startPreviewTimer: function() {
          self.originalValue = self.textarea.val();
          setInterval(self.checkForChanges, 1000);
        }
      };
      this.markdownInplaceEditor = self;
      self.initialize();
    });
    return this;
  };
})(jQuery);

// Plugin for parallax scrolling
(function($) {
  var defaults = {};
  $.fn.parallax = function(options) {
    var opts = $.extend({}, defaults, options);
    return this.each(function()
    {
      var $this = $(this);
      if (this.parallax) { return false; }
      var self = {
        initialize: function() {
          self.container = $this;
          // find the panels
          var panels = $('.parallaxPanel', $this);
          // set the background images for each panel
          panels.each(function(index, panel) {
            var $panel = $(panel);
            var background = $panel.data('background');
            if (background) {
              $panel.css({'background-image': "url('images/" + $panel.data('background') + "')",
                'background-position': '0px ' + (panel.offsetTop - 130)/8 + 'px'});
            }
          });
          // hook the scroll event
          $(document).scroll(function(event) {
            var offset = $(window).scrollTop();
            var panels = $('.parallaxPanel');
            panels.each(function(index, panel) {
              $(panel).css({'background-position': '0px ' + (panel.offsetTop - offset - 130)/8 + 'px'});
            });
          });
        }
      };
      this.parallax = self;
      self.initialize();
    });
    return this;
  };
})(jQuery);


