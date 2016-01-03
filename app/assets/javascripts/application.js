//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker//locales/bootstrap-datepicker.de.js
//= require moment
//= require underscore
//= require gmaps/google
//= require jquery.jcrop
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
        language: "de-DE"
    });
});

$(document).ready(function(){
    $('.daterange').attr("value", "");
});


$(function() {
    $('.datepicker').datepicker({
            language: "de-DE"
    });
    $('.daterange').daterangepicker({
            'startDate': false,
            'endDate': false,
            'minDate': setDate(),
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
        $.get($('#houses_search').attr('action'), $('#houses_search').serialize(), null, "script");
        return false;
    });
    $('#houses_search input').keyup(function(){
        $.get($('#houses_search').attr('action'), $('#houses_search').serialize(), null, "script");
        return false;
    });
    $('#selectAll').click(function() {
        $('#houses_search input').each(function() {
            this.checked = false;
        });
        $.get($('#houses_search').attr('action'), $('#houses_search').serialize(), null, "script");
        return false;
    });
    $('[data-toggle="tooltip"]').tooltip();
    $('#tab_location').on('shown.bs.tab', function (e) {
      google.maps.event.trigger(map, 'resize');
    });
});

//call functions

function setDate() {
    var d = new Date();
    var month = d.getMonth() + 1;
    var day = d.getDate();
    var output = (('' + day).length < 2 ? '0' : '') + day + '.' + (('' + month).length < 2 ? '0' : '') + month + '.' + d.getFullYear();
    return output;
}

function unavailable(date) {
    dmy = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
    if($.inArray(dmy, gon.dates) == -1) {
        return [true, ""];
    }else {
        return [false, "", "Unavailable"];
    }
}

