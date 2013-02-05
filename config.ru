require 'rubygems'
require 'bundler'
require 'sinatra'
require 'sinatra/settings'
require File.join(File.dirname(__FILE__), 'app.rb')

run Sinatra::Application

