#! /usr/bin/ruby
require 'sinatra'
require 'json'
require 'rubygems'
require 'pp'
require_relative 'rimesync/lib/rimesync.rb'

post '/payload' do
    ts = TimeSync.new(baseurl="http://timesync-staging.osuosl.org/v0/")
    ts.authenticate(username:"test", password:"test", auth_type:"password")

    push = JSON.parse(request.body.read)

    user, duration, activities, issue_uri, date_worked, notes = nil

    push["commits"].each do |commit|
        # Get all the necessary time data
        message = commit["message"].split(/\n/)
        #puts "#{message}"
        user = commit["author"]["username"]
        duration = message[2].split(' ', 2)[1].to_i
        #duration = duration[1].to_i
        activities = message[3].split(' ', 2)[1].split(',')
        #activities = activities[1].split(',')
        issue_uri = message[4].split(' ', 2)[1]
        #issue_uri = issue_uri[1]
        date_worked = commit["timestamp"].split('T')[0]
        notes = message[0]
        
    end

    project = push["repository"]["name"]

    puts "Duration: #{duration}"
    puts "User: #{user}"
    puts "Project: #{project}"
    puts "Activities: #{activities}"
    puts "Issue URI: #{issue_uri}"
    puts "Date Worked: #{date_worked}"
    puts "Notes: #{notes}"

    duration = 1
    time = {
        'duration': duration,
        'user': user,
        'project': project,
        'activities': activities,
        'date_worked': date_worked,
        'issue_uri': issue_uri,
        'notes': notes
    }
    puts "#{time}"

    res = ts.create_time(time)
    puts "#{res}"

    # This prevents a NoMethodError for some reason
    # Something about the return value being a string?
    "done\n"
end
