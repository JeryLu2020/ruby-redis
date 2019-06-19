require 'redis'
require 'date'
require 'json'

module Api
    module V1
      class PostsController < ApplicationController

        def index

            $redis = Redis.new(
                :host => 'jeryredis.redis.cache.windows.net', 
                :port => 6380, 
                :db => 0, 
                :password => "ecumXVZIa93DXBTZ7pEPW70kSItqIzTf6c5PC7PrtLk=", 
                :ssl => :true
            )

            print $redis.ping()

            print "Connected\n"

            data = {"sender" => "Jery Lu" }

            msg = 'hello from jery'

            $redis.publish("chat", data.merge('message' => msg).to_json)

            timestamp = DateTime.now.strftime("%d/%m/%Y %H:%M:%S")

            puts "#send '#{msg}' on #{timestamp}"

            # render json: { status: 'SUCCESS', message: data.merge('message' => msg).to_json }
            render 'redis', locals: { message: data.merge('message' => msg).to_json }
        end
      end
    end
  end