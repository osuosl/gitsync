#! /usr/bin/ruby
require 'sinatra'
require 'json'
require 'rubygems'
require 'pp'

post '/payload' do
  push = JSON.parse(request.body.read)
  #puts "I got some JSON: #{push["commits"].inspect}"

  push["commits"].each do |commit|
      commit.each do |thing|
=begin
        puts "Author: #{commit["author"]}"
        puts "Committer: #{commit["committer"]}"
        puts "Message: #{commit["message"]}"
=end
        puts "#{thing}"
      end
  end
end
