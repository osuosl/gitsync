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


    push["commits"].each do |commit|
        # Get all the necessary time data
        message = commit["message"].split(/\n/)

        project_name = push["repository"]["name"]
        projects = ts.get_projects()

        # Ruby takes local scoping a little *too* literally
        slug = nil
        # Get the slug of the project
        projects.each do |project|
            if project['name'].downcase == project_name.downcase
                slug = project['slugs'][0]
            end
        end

        time = {
            'user' => commit["author"]["username"],
            'duration' => message[2].split(' ', 2)[1].to_i,
            'project' => slug,
            'activities' => message[3].split(' ', 2)[1].split(','),
            'issue_uri' => message[4].split(' ', 2)[1],
            'date_worked' => commit["timestamp"].split('T')[0],
            'notes' => message[0]
        }

        res = ts.create_time(time)
    end

    # This prevents a NoMethodError for some reason
    # Something about the return value being a string?
    "done\n"
end
