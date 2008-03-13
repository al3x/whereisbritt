#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

get '/' do
  body = <<-HTML
  <html>
    <head>
      <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
      <title>Where is Britt?</title>
      <style type="text/css">
        body {
          background-color: #fff;
          color: #333;
          font-family: Helvetica, Arial, "sans-serif";
          font-size: 62.5%;
          margin: 10px 30% 0 30%;
          text-align: center;
          width: auto;
        }
        h1 { font-size: 7em; }
        p { font-size: 3.5em; }
        .info_text { font-size: 2em;}
        #container {
         clear: both;
         margin: auto;
        }
      </style>
      <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAXM3KHrJWvutJ8BC8pvRJvhSmbtbI58sJnUq1AueY0BvTVoVv3BQE7yYS-cf2z53WW7zyF7S6-dY7wQ" type="text/javascript"></script>
      <script type="text/javascript">
        //<![CDATA[
        function load() {
          if (GBrowserIsCompatible()) {
            var map = new GMap2(document.getElementById("map"));
            map.setCenter(new GLatLng(51.4788, -0.0107), 1);
            
            var brittIcon = new GIcon();
            brittIcon.image = "http://static.al3x.net/britt_icon.png";
            brittIcon.shadow = "http://labs.google.com/ridefinder/images/mm_20_shadow.png";
            brittIcon.iconSize = new GSize(30, 30);
            brittIcon.shadowSize = new GSize(46, 31);
            brittIcon.iconAnchor = new GPoint(6, 20);
            brittIcon.infoWindowAnchor = new GPoint(5, 1);
            
            var bounds = map.getBounds();
            var southWest = bounds.getSouthWest();
            var northEast = bounds.getNorthEast();
            var lngSpan = northEast.lng() - southWest.lng();
            var latSpan = northEast.lat() - southWest.lat();
            var point = new GLatLng(southWest.lat() + latSpan * Math.random(), southWest.lng() + lngSpan * Math.random());
            var marker = new GMarker(point, { title: "Britt", icon: brittIcon });
            
            GEvent.addListener(marker, "click", function() {
              marker.openInfoWindowHtml('<span class="info_text">Britt</span>');
            });
            
            map.addOverlay(marker);
          }
        }
        //]]>
      </script>
    </head>
    <body onload="load()" onunload="GUnload()">
      <div id="container">
        <h1>Where is Britt?</h1>
        <div id="map" style="width: 500px; height: 300px"></div>
        <p>That's where Britt is!</p>
      </div>
    </body>
  </html>
  HTML
  erb body
end
