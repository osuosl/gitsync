#! /usr/bin/ruby
require 'sinatra'
require 'json'
require 'rubygems'
require 'pp'
# This is apparently not how to do it
#require 'rimesync'

post '/payload' do
    #ts = rimesync.Timesync("http://timesync-staging.osuosl.org/v0/")
    #ts.authenticate(username="test", password="test", auth_type="password")

    push = JSON.parse(request.body.read)
    #puts "I got some JSON: #{push["commits"].inspect}"

    push["commits"].each do |commit|
        puts "Author: #{commit["author"]}"
        puts "Committer: #{commit["committer"]}"
        puts "Message: #{commit["message"].split(/\n/)}"
    end
end
