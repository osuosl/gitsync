#! /usr/bin/ruby
require 'sinatra'
require 'json'
require 'rubygems'
require 'pp'
require 'bundler/setup'
require 'rimesync'

post '/payload' do
    # Auth with Timesync. This will need to be removed once a real auth system
    # is implemented
    ts = TimeSync.new(baseurl="http://timesync-staging.osuosl.org/v0/")
    ts.authenticate(username:"test", password:"test", auth_type:"password")

    # Parses the data for reading
    push = JSON.parse(request.body.read)

    # Goes through each commit from the push and submits a time for it
    push["commits"].each do |commit|
        # Get all the necessary data from the commit message
        message = commit["message"].split(/\n/)

        # Gets the name of the repository, which should be the name of the
        # project
        project_name = push["repository"]["name"]
        projects = ts.get_projects()

        # Ruby takes local scoping a little *too* literally
        slug = nil
        # Get the slug of the project
        # Have to do this the hard way because there's no easy way to do it
        projects.each do |project|
            if project['name'].downcase == project_name.downcase
                slug = project['slugs'][0]
            end
        end

        # Creates the time object
        time = {
            'user' => commit["author"]["username"],
            'duration' => message[2].split(' ', 2)[1].to_i,
            'project' => slug,
            'activities' => message[3].split(' ', 2)[1].split(','),
            'issue_uri' => message[4].split(' ', 2)[1],
            'date_worked' => commit["timestamp"].split('T')[0],
            'notes' => message[0]
        }

        # Submit the time
        res = ts.create_time(time)
    end

    # This prevents a NoMethodError for some reason
    # Something about the return value being a string?
    # This gets printed to the console so you know everything's been completed
    "done\n"
end
