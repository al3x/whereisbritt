#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

get '/' do
  body = <<-HTML
  <html>
    <head>
      <title>Where is Britt?</title>
      <style type="text/css">
        body {
          background-color: #fff;
          color: #333;
          font-family: Helvetica, Arial, "sans-serif";
          font-size: 1.2em;
        }
      </style>
    </head>
    <body>
      
    </body>
  </html>
  
  HTML
  erb body
end
