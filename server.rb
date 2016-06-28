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
        #puts "Author: #{commit["author"]}"
        #puts "Committer: #{commit["committer"]}"
        message = commit["message"].split(/\n/)
        puts "#{message}"
        user = message[2].split(' ', 2)
        project = message[3].split(' ', 2)
        duration = message[4].split(' ', 2)
        activities = message[5].split(' ', 2)
        issue = message[6].split(' ', 2)
        
        puts "User: #{user}"
        puts "Project: #{project}"
        puts "Duration: #{duration}"
        puts "Activities: #{activities}"
        puts "Issue: #{issue}"
    end
end
