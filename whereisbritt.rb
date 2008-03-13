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
          width: auto;
        }
        h1 { font-size: 6em; }
        p { font-size: 4em; }
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
            map.setCenter(new GLatLng(37.4419, -122.1419), 13);
          }
        }
        //]]>
      </script>
    </head>
    <body onload="load()" onunload="GUnload()">
      <div id="container">
        <h1>Where is Britt?</h1>
        <p>Britt is in <span class="location"><%= "random location" %></span></p>
        <div id="map" style="width: 500px; height: 300px"></div>
        <p>That's where Britt is!</p>
      </div>
    </body>
  </html>
  HTML
  erb body
end
