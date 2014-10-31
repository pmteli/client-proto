

$( document ).ready(function() {
// Handler for .ready() called.

    init_ajax_selector();

    //init_multiselect();

    console.log("registering load_building function");
    //this is a hack. PT
    $('#building_selector .bootstrap-select ul.dropdown-menu li > a').click(function(e){
        var building_id  = $(this).find('span').text();
        load_building(building_id);
    });

    console.log("Initializing selectpicker");
    if ($('.selectpicker').length) {
        $('.selectpicker').selectpicker();
    };

    console.log("invoking date picker");
    $(".datepicker").bdatepicker();

    $(".DTTT").remove();
});


function load_building(building_id) {
    console.log('loading buildings' + building_id);
    //ajaxx call to load buildings
};


function init_ajax_selector() {
    $( ".ajax-selector" )
        .change(function (e) {
            var param = "";
            var url= $(this).attr("data-url");
            console.log("url = " + url);
            $(this).find("option:selected" ).each(function() {
                var param_1 = $( this).attr("param_1");
                var param_2 = $( this ).attr("value");
                //console.log(t);
                //param += "?param_1=" + $( this ).text();
                param += "?param_1=" + param_1;
                param += "&param_2=" + param_2;
            });
            $.ajaxSetup({
                'beforeSend': function (xhr){
                    xhr.setRequestHeader("Accept", "text/javascript")}
            });
            $.ajax({
                context: this,
                url:  url  + param,
                dataType: "html"
            })
                .done(function( data ) {
                    console.log(data);
                    var json = eval(data);
                    if ( console && console.log ) {
                        //console.log(data);
                    }
                });
        });
};


(function($, window)
{

    var _initSidebar = function () {
        var $sidebar = $('.secondary-content');
        var _speed = 500;
        var $sidebarWidth, $toggle;

        var _init = function () {
            _initToggle();
            //setTimeout( function () {
               // _setHeight();
            //}, 250);
        };

        var _setHeight = function () {
            var _shim = 0;
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
        var $container = $('#onboarding');
        var $controls, $indicators, $options;
        var _activeClass = 'active';

        var _init = function () {
            $controls = $container.find('.controls');
            $indicators = $container.find('.indicators li');
            $options = $container.find('.option');

            _initControls();
            _initOptions();

            _initBusinessSize();

            setTimeout(function () {
                $container.modal('show');
            }, 500);
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

        var _initBusinessSize = function () {
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
            console.log("adjusting height");
            _setHeight();
        };

        var _setHeight = function () {
            var _height = 0;
            var _shim = 0;
            var $temp, _tempHeight;

            for (var x = $horizontalRecs.length; x--;) {
                $temp = $($horizontalRecs[x]);
                _tempHeight = $temp.outerHeight();

                console.log(_tempHeight);

                if (_tempHeight > _height) {
                    _height = _tempHeight;
                }
            }
            //$horizontalRecs.outerHeight((_height + _shim) + 'px');

            //setTimeout(function () {
            //    $horizontalRecs.outerHeight((_height + _shim) + 'px');
            //}, 2500);
        };

        if ($container.length > 0) {
            _init();
        }
    };

    var _initSliders = function () {
        var $sliders = $('.slider');

        var _init = function () {
            for (var x = $sliders.length; x--;) {
                _initSlider($($sliders[x]));
            }
        };

        var _initSlider = function ($slider) {
            var _min, _max, defaults;

            _min = parseInt($slider.attr('data-min'));
            _max = parseInt($slider.attr('data-max'));
            _defaults = [Math.round(_max*.33), Math.round(_max*.66)];

            $slider.slider({
                range: true,
                min: _min,
                max: _max,
                values: _defaults
            });
        };

        if ($sliders.length > 0) {
            _init();
        }
    };

    _initRecommendations();
    _initSidebar();
    _initOnboardingModal();
    _initSliders();
})(jQuery, window);






function init_multiselect() {

    if ($('#select2_1').length)
        $('#select2_1').select2();
    $('#multiselect-optgroup').multiSelect({ selectableOptgroup: true });
    $('#pre-selected-options').multiSelect();
    $('#multiselect-custom').multiSelect({
        selectableHeader: "<div class='custom-header'>Registered Tenant Users</div>",
        selectionHeader: "<div class='custom-header'>Selected Users for Building</div>",
    });
}

function delete_tab(tab_id) {

    //make previous tab current
    if ($("#" + tab_id).hasClass("active")) {
        $("#" + tab_id).removeClass("active");
        var prev = $("#" + tab_id).prev();
        if (prev != null) {
            prev.addClass("active");
            var building = prev.find('a').text();
            get_building_data(building);
        }
    }
    $("#" + tab_id).remove();
}

function load_tab(building) {
    $.ajaxSetup({
        'beforeSend': function (xhr){
            xhr.setRequestHeader("Accept", "text/javascript")}
    });
    $.ajax({
        url:  "dashboard/building_content" + "/" + building,
        dataType: "html"
    })
        .done(function( data ) {
            var json = eval(data);
            if ( console && console.log ) {
                //console.log(data);
            }
        });
}

function load_chart(id, url) {
    console.log('loading chart for ' + url);
    $.ajaxSetup({
        'beforeSend': function (xhr){
            xhr.setRequestHeader("Accept", "text/javascript")}
    });
    $.ajax({
        //url:  url + "?id=" + id + "&chart=" + chart,
        url:  url + "&id=" + id,
        dataType: "html"
    })
        .done(function( data ) {
            var json = eval(data);
            if ( console && console.log ) {
                //console.log(data);
            }
        });
};

function load_recommendations(id, category, url) {
    console.log('loading recommendations for ' + category);
    $.ajaxSetup({
        'beforeSend': function (xhr){
            xhr.setRequestHeader("Accept", "text/javascript")}
    });
    $.ajax({
        url:  url + "?id=" + id + "&category=" + category,
        dataType: "html"
    })
        .done(function( data ) {
            var json = eval(data);
            if ( console && console.log ) {
                //console.log(data);
            }
        });
};


function form_wizards_init() {

    $(function()
    {
        var bWizardTabClass = '';
        $('.wizard').each(function()
        {
            if ($(this).is('#rootwizard'))
                bWizardTabClass = 'bwizard-steps';
            else
                bWizardTabClass = '';

            var wiz = $(this);

            $(this).bootstrapWizard(
                {
                    onNext: function(tab, navigation, index)
                    {
                        if(index==1)
                        {
                            // Make sure we entered the title
                            if(!wiz.find('#select2_1').val()) {
                                alert('You must select a campaign first.');
                                wiz.find('#select2_1').focus();
                                return false;
                            }
                        }
                    },
                    onLast: function(tab, navigation, index)
                    {
                        // Make sure we entered the title
                        if(!wiz.find('#select2_1').val()) {
                            alert('You must enter the product title');
                            wiz.find('#select2_1').focus();
                            return false;
                        }
                    },
                    onTabClick: function(tab, navigation, index)
                    {
                        // Make sure we entered the title
                        if(!wiz.find('#select2_1').val()) {
                            alert('You must enter the product title');
                            wiz.find('#select2_1').focus();
                            return false;
                        }
                    },
                    onTabShow: function(tab, navigation, index)
                    {
                        var $total = navigation.find('li:not(.status)').length;
                        var $current = index+1;
                        var $percent = ($current/$total) * 100;

                        if (wiz.find('.progress-bar').length)
                        {
                            wiz.find('.progress-bar').css({width:$percent+'%'});
                            wiz.find('.progress-bar')
                                .find('.step-current').html($current)
                                .parent().find('.steps-total').html($total)
                                .parent().find('.steps-percent').html(Math.round($percent) + "%");
                        }

                        // update status
                        if (wiz.find('.step-current').length) wiz.find('.step-current').html($current);
                        if (wiz.find('.steps-total').length) wiz.find('.steps-total').html($total);
                        if (wiz.find('.steps-complete').length) wiz.find('.steps-complete').html(($current-1));

                        // mark all previous tabs as complete
                        navigation.find('li:not(.status)').removeClass('primary');
                        navigation.find('li:not(.status):lt('+($current-1)+')').addClass('primary');

                        // If it's the last tab then hide the last button and show the finish instead
                        if($current >= $total) {
                            wiz.find('.pagination .next').hide();
                            wiz.find('.pagination .finish').show();
                            wiz.find('.pagination .finish').removeClass('disabled');
                        } else {
                            wiz.find('.pagination .next').show();
                            wiz.find('.pagination .finish').hide();
                        }
                    },
                    tabClass: bWizardTabClass,
                    nextSelector: '.next',
                    previousSelector: '.previous',
                    firstSelector: '.first',
                    lastSelector: '.last'
                });

            wiz.find('.finish').click(function()
            {
                alert('Finished!, Starting over!');
                wiz.find("a[data-toggle*='tab']:first").trigger('click');
            });
        });
    });
};

