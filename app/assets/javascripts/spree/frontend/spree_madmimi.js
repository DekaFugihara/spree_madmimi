//= require store/spree_core

jQuery.ajaxSetup({
    'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

var SpreeMadmimiApp = {

  doSubmit: function(e) {
          SpreeMadmimiApp.getBusy(null); // could really use $.proxy here but spree doesn't have 1.4
          $.post(this.action+'.js', $(this).serialize(), SpreeMadmimiApp.getNotBusy, "script");
          return false;
  },

  getBusy : function( fn ) {
          $("body").css('cursor', 'progress');
          $("#busy_indicator").fadeIn('fast', fn);
  },

  getNotBusy : function() {
          $("body").css('cursor', 'default');
          $("#busy_indicator").fadeOut('fast');
  }

};

jQuery(document).ready( function() {

    $('#newsletter_subscribe_wrap form').bind('submit', SpreeMadmimiApp.doSubmit);

});
