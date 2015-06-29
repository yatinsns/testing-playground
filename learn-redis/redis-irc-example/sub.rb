require 'rubygems'
require 'redis'
require 'json'

$redis = Redis.new(:timeout => 0)

$redis.subscribe('rubyonrails', 'ruby-lang') do |on|
  on.message do |channel, message|
    data = JSON.parse message
    puts "##{channel} - [#{data['user']}]: #{data['msg']}"
  end
end
