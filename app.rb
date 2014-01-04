require 'bundler'
Bundler.require
require './lib/compliment.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/compliments.db")

module Blake
  class Awesome < Sinatra::Application
    
    get '/' do
      @compliments = Compliment.all
      erb :index
    end

    helpers do 
      def simple_partial(template)
        erb template
      end
    end

  end
end

DataMapper.auto_upgrade!