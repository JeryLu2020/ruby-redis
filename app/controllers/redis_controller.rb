require 'redis'
require 'date'
require 'json'

class RedisController < ApplicationController
    $redis = Redis.new(
        :host => 'jery-redis.redis.cache.windows.net', 
        :port => 6380, 
        :db => 0, 
        :password => "ErBsK9l0KA9WlduqhlsV0Qd22RGq9B4RFYjb5Uo5F5o=", 
        :ssl => :true
    )

    print $redis.ping()
    print "Connected\n"

    data = {"sender" => "Jery Lu" }

    msg = 'hello from jery'

    loop do
        sleep 10

        $redis.publish("chat", data.merge('message' => msg).to_json)

        timestamp = DateTime.now.strftime("%d/%m/%Y %H:%M:%S")

        puts "#send '#{msg}' on #{timestamp}"
    end
end