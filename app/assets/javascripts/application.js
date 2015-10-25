// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require jquery-ui/datepicker
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require jquery_nested_form
//= require ckeditor/init
//= require turbolinks
//= require_tree .

$(document).on('nested:fieldAdded', function(event){
    // this field was just inserted into your form
    var field = event.field;
    // it's a jQuery object already! Now you can find date input
    var dateField = field.find('.date');
    // and activate datepicker on it
    dateField.datepicker({
        dateFormat: 'dd.mm.yy'
    });
});

function unavailable(date) {
    dmy = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
    if($.inArray(dmy, gon.dates) == -1) {
        return [true, ""];
    }else {
        return [false, "", "Unavailable"];
    }
}

$(function() {

    $('.datepicker').datepicker({
            dateFormat: 'dd.mm.yy'
    });
    $('.daterange').daterangepicker({
            'autoApply': true,
            "opens": "center",
            "locale": {
                "format": "DD.MM.YYYY",
                "separator": " - ",
                "daysOfWeek": ["So","Mo","Di", "Mi", "Do", "Fr", "Sa"],
                "monthNames": ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"],
                "firstDay": 1
            }
        },
        function(start, end, label) {
            $("#booking_start_date").val(start.format("DD.MM.YYYY"));
            $("#booking_end_date").val(end.format("DD.MM.YYYY"));

    });
    $('#houses_search input').change(function(){
        $.get($('#houses_serch').attr('action'), $('#houses_search').serialize(), null, "script");
        return false;
    });
    $('#selectAll').click(function() {
        $('#houses_search input').each(function() {
            this.checked = false;
        });
        $.get($('#houses_serch').attr('action'), $('#houses_search').serialize(), null, "script");
        return false;
    });
});

