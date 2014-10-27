

(function($, window)
{

	var _initSidebar = function () {
		var $sidebar = $('.secondary-content');
		var _speed = 500;
		var $sidebarWidth, $toggle;

		var _init = function () {
			_initToggle();
			setTimeout( function () {
				_setHeight();
			}, 500);
		};

		var _setHeight = function () {
			var _shim = 71;
			var _primaryHeight = $('.primary-content').height() + _shim;
			var $widgetContainer = $('.secondary-content .widget-container');
			var _widgetContainerHeight = $widgetContainer.height();

			if ($(window).width() < 1025) {
				$widgetContainer.height($('body').height() + 'px');
			} else {
				if (_primaryHeight > _widgetContainerHeight) {
					$widgetContainer.height(_primaryHeight + 'px');
				}
			}
		}

		var _initToggle = function () {
			$toggle = $sidebar.find('.slide-toggle');

			$toggle.bind('click', function (e) {
				e.preventDefault();
				$sidebarWidth = $sidebar.outerWidth() - 5;

				if ($sidebar.hasClass('closed')) {
					_openSidebar();
				} else {
					_closeSidebar();
				}
			});
		}

		var _closeSidebar = function () {
			$sidebar.animate({
				right: '-' + $sidebarWidth + 'px'
			}, _speed, function () {
				$toggle.removeClass('fa-angle-double-right');
				$toggle.addClass('fa-angle-double-left');
				$sidebar.addClass('closed');
			});
		};

		var _openSidebar = function () {
			$sidebar.animate({
				right: '0px'
			}, _speed, function () {
				$toggle.removeClass('fa-angle-double-left');
				$toggle.addClass('fa-angle-double-right');
			}).removeClass('closed');
		};

		if ($sidebar.length > 0) {
			_init();
		}
	};


	var _initOnboardingModal = function () {
		var pageName = $('#content .main')[0].className;
		var $container = $('#onboarding');
		var $controls, $indicators, $options;
		var _activeClass = 'active';

		var _init = function () {
			$controls = $container.find('.controls');
			$indicators = $container.find('.indicators li');
			$options = $container.find('.option');

			_initControls();
			_initOptions();

			_initBusinessSize($container);

			if (pageName == 'your-cost') {
				setTimeout(function () {
					$container.modal('show');
				}, 500);
			};
		};

		var _initControls = function () {
			$controls.bind('click', function (e) {
				var $target = $(e.target);

				if ($target.hasClass('no-thanks')) {

				}
				if ($target.hasClass('skip-link')) {
					e.preventDefault();
				}
				if ($target.hasClass('next')) {
					_navigate('next');
				}
			});
		};

		var _initOptions = function () {
			var $parent;
			var _class = "selected";

			$options.bind('click', function (e) {
				e.preventDefault();
				var $this = $(this);

				$parent = $this.closest('.options');
				$parent.find('.option').removeClass(_class);
				$this.addClass(_class);
			});
		};

		var _navigate = function (_dir) {
			var $currentPane = $container.find('.pane.' + _activeClass);
			var $newPane = (_dir == 'next') ? $currentPane.next('.pane') : $currentPane.prev('.pane');
			var $nextButton = $controls.find('.next');

			if ($newPane.length > 0) {
				$nextButton.text('Next')
				$currentPane.fadeOut('fast', function () {
					$newPane.fadeIn('fast').addClass(_activeClass);

					_updateIndicators($newPane.attr('id'));
				}).removeClass(_activeClass);

				if ($newPane.next('.pane').length < 1) {
					if (_dir == 'next') {
						$nextButton.text('Done')
					}
				}
			}
		};

		var _updateIndicators = function (_id) {
			var _class = 'fa-circle';

			$indicators.removeClass(_class);
			$indicators.filter('.' + _id).addClass(_class);
		};

		if ($container.length > 0) {
			_init();
		}
	};

	var _initRecommendations = function () {
		var $container = $('#recommendations');
		var $horizontalRecs;

		var _init = function () {
			$horizontalRecs = $container.filter('.horizontal').find('.well');

			_setHeight();
		};

		var _setHeight = function () {
			var _height = 0;
			var _shim = 70;
			var $temp, _tempHeight;

			for (var x = $horizontalRecs.length; x--;) {
				$temp = $($horizontalRecs[x]);
				_tempHeight = $temp.outerHeight();

				if (_tempHeight > _height) {
					_height = _tempHeight;
				}
			}

			setTimeout(function () {
				$horizontalRecs.outerHeight((_height + _shim) + 'px');
			}, 250);
		};

		if ($container.length > 0) {
			_init();
		}
	};

	var _initBusinessSize = function ($container) {
		var $radio = $container.find('input:radio[name="business-size"]');
		var $yesOptions = $container.find('.yes-options');
		var $noOptions = $container.find('.no-options').hide();

		$radio.change(function () {
			if (this.value == 'yes') {
				$noOptions.fadeOut('fast', function () {
					$yesOptions.fadeIn('fast');
				});
			} else {
				$yesOptions.fadeOut('fast', function () {
					$noOptions.fadeIn('fast');
				});
			}
		});
	};

	var _initSliders = function () {
		var $sliders = $('.slider');

		var _init = function () {
			for (var x = $sliders.length; x--;) {
				_initSlider($($sliders[x]));
			}
		};

		var _initSlider = function ($slider) {
			var _type, _min, _max, defaults, _step;
			var _opts = {};
			
			_type = $slider.data('type');
			_min = $slider.data('min');
			_max = $slider.data('max');
			_defaults = [Math.round(_max*.33), Math.round(_max*.66)];
			_step = $slider.data('step');

			switch (_type) {
				case 'default':
					break;
				case 'step':
					_opts.step = _step;
					_opts.min = _min;
					_opts.max = _max;
					break;
				default:
					_opts.range = true;
					_opts.min = _min;
					_opts.max = _max;
					_opts.values = _defaults;
					break;
			}

			$slider.slider(_opts);

			$slider.closest('.slider-container').append('<span class="label-min">' + _min + '</span><span class="label-max">' + _formatNum(_max) + '</span>');
		};

		var _formatNum = function (_val) {
			var retVal =  _val.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1' + ',');

			return retVal;
		};

		if ($sliders.length > 0) {
			_init();
		}
	};

	var _initCarouselCharts = function () {
		var $charts = $('.carousel .chart');
		var $toggle;

		var _init = function () {
			_initControls();
		};

		var _initControls = function () {
			$toggle = $charts.find('.chart-toggle');

			$toggle.on('click', function (e) {
				e.preventDefault();

				_toggleChart($(this).closest('.item'));
			});
		};

		var _toggleChart = function ($item) {
			var $img = $item.find('img');

			if ($item.hasClass('full-chart')) {
				$item.removeClass('full-chart');
				$img.attr('src', '../assets/images/placeholder-electric-graph-sm.jpg');
			} else {
				$item.addClass('full-chart');
				$img.attr('src', '../assets/images/placeholder-electric-graph-lg.jpg');
			}
		};

		if ($charts.length > 0) {
			_init();
		};
	};

	var $buildingsize = $('.building-size');

	if ($buildingsize.length > 0) {
		_initBusinessSize($buildingsize);
	}
	
	$('#billing').carousel('pause');
	
	$('.carousel .carousel-indicators li').on('click', function () {
		$(this).closest('.carousel').carousel('pause');
	});
	
	_initRecommendations();
	_initSidebar();
	_initOnboardingModal();
	_initSliders();
	_initCarouselCharts();
})(jQuery, window);
