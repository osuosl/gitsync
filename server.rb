require 'sinatra'
require 'json'

post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"

  push[:commits].each do |commit|
      puts "#{commit}"
  end
end
