//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap/tooltip
//= require bootstrap/tab
//= require bootstrap/modal
//= require bootstrap/alert
//= require bootstrap/collapse
//= require moment
//= require underscore
//= require gmaps/google
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require jquery.validate.localization/messages_de
//= require jquery.jcrop
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require jquery_nested_form
//= require ckeditor/init
//= require_tree .

$(document).on('nested:fieldAdded', function(event){
    // this field was just inserted into your form
    var field = event.field;
    // it's a jQuery object already! Now you can find date input
    var dateField = field.find('.date');
    // and activate datepicker on it
    dateField.datepicker({
      numberOfMonths: 3,
      dateFormat: 'dd.mm.yy',
      monthNames: ['Januar','Februar','März','April','Mai','Juni','Juli','August','September','Oktober','November','Dezember'],
      dayNames: ['Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag','Samstag'],
      dayNamesMin: ['So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa'],
      minDate: null,
      maxDate: null
    });
});

$(function() {
    $('#new_booking').validate({
      ignore: "",
      rules: {
        'booking[lastname]': { required: true },
        'booking[firstname]': { required: true },
        'booking[email]': { required: true },
        'booking[start_date]': { required: true },
      },
      messages: {
        'booking[start_date]': 'Bitten wählen Sie einen zulässigen Zeitraum aus!',
      }
    });
    $('.datepicker').datepicker({
      numberOfMonths: 3,
      dateFormat: 'dd.mm.yy',
      monthNames: ['Januar','Februar','März','April','Mai','Juni','Juli','August','September','Oktober','November','Dezember'],
      dayNames: ['Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag','Samstag'],
      dayNamesMin: ['So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa']
    });
    $('#daterange').daterangepicker({
      applyButtonText: 'Annehmen',
      clearButtonText: 'Löschen',
      cancelButtonText: 'Abbrechen',
      dateFormat: 'dd. M. yy',
      initialText : 'Wählen Sie einen Zeitraum aus!',
      datepickerOptions: {
        dateFormat: 'dd.mm.yy',
        monthNames: ['Januar','Februar','März','April','Mai','Juni','Juli','August','September','Oktober','November','Dezember'],
        dayNames: ['Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag','Samstag'],
        dayNamesMin: ['So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa'],
        minDate: 0,
        maxDate: null
      },
      onChange: function() {
        var range = $('#daterange').daterangepicker("getRange");
        var start = range.start;
        var end = range.end

        $("#booking_start_date").val(start);
        $("#booking_end_date").val(end);
      }
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
