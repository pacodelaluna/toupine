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
//= require jquery-1.11.3.min
//= require jquery.anystretch.min
//= require spree
//= require spree/frontend/checkout
//= require spree/frontend/product
//= require spree/frontend/cart
//= require tinynav.min
//= require scripts


(function() {
  window.Spree = (function() {
    function Spree() {}

    Spree.ready = function(callback) {
      return jQuery(document).ready(callback);
    };

    Spree.mountedAt = function() {
      return "/";
    };

    Spree.pathFor = function(path) {
      var locationOrigin;
      locationOrigin = ("" + window.location.protocol + "//" + window.location.hostname) + (window.location.port ? ":" + window.location.port : "");
      return "" + locationOrigin + (this.mountedAt()) + path;
    };

    Spree.url = function(uri, query) {
      if (uri.path === void 0) {
        uri = new Uri(uri);
      }
      if (query) {
        $.each(query, function(key, value) {
          return uri.addQueryParam(key, value);
        });
      }
      return uri;
    };

    Spree.ajax = function(url_or_settings, settings) {
      var url;
      if (typeof url_or_settings === "string") {
        return $.ajax(Spree.url(url_or_settings).toString(), settings);
      } else {
        url = url_or_settings['url'];
        delete url_or_settings['url'];
        return $.ajax(Spree.url(url).toString(), url_or_settings);
      }
    };

    Spree.routes = {
      states_search: Spree.pathFor('api/states'),
      apply_coupon_code: function(order_id) {
        return Spree.pathFor("api/orders/" + order_id + "/apply_coupon_code");
      }
    };

    return Spree;

    Spree.fetch_cart = function() {
      return $.ajax({
        url: Spree.pathFor("cart_link"),
        success: function(data) {
          return $('#link-to-cart').html(data);
        }
      });
    };

  })();

}).call(this);

Spree.ready(function($) {
    if (($('form#update-cart')).is('*')) {
      ($('form#update-cart a.delete')).show().one('click', function() {
        ($(this)).parents('.line-item').first().find('input.line_item_quantity').val(0);
        ($(this)).parents('form').first().submit();
        return false;
      });
    }
    return ($('form#update-cart')).submit(function() {
      return ($('form#update-cart #update-button')).attr('disabled', true);
    });
});