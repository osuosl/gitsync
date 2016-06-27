#! /usr/bin/ruby
require 'sinatra'
require 'json'
require 'rubygems'
require 'pp'

post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"

  #push[:commits].each do |commit|
  #puts "#{commit}"
  #end
end
