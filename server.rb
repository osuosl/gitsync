#! /usr/bin/ruby
require 'sinatra'
require 'json'
require 'rubygems'
require 'pp'
require_relative 'rimesync/rimesync.rb'

post '/payload' do
    #ts = Timesync.new(baseurl="http://timesync-staging.osuosl.org/v0/")
    #ts.authenticate(username="test", password="test", auth_type="password")

    puts "#{request.body.read}"
    #push = JSON.parse(request.body.read)
    #puts "#{push}"

    #push["commits"].each do |commit|
    #    #puts "Author: #{commit["author"]}"
    #    #puts "Committer: #{commit["committer"]}"
    #    message = commit["message"].split(/\n/)
    #    #puts "#{message}"
    #    user = commit["author"]["username"]
    #    project = message[3].split(' ', 2)
    #    duration = message[4].split(' ', 2)
    #    activities = message[5].split(' ', 2)
    #    issue = message[6].split(' ', 2)
    #    date_worked = commit["timestamp"]
    #    notes = message[0]
    #    
    #    puts "User: #{user}"
    #    puts "Project: #{project}"
    #    puts "Duration: #{duration}"
    #    puts "Activities: #{activities}"
    #    puts "Issue: #{issue}"
    #    puts "Date Worked: #{date_worked}"
    #    puts "Notes: #{notes}"
    #end
end
