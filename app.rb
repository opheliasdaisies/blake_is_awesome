require 'bundler'
Bundler.require
require './lib/compliment.rb'


module Blake
  class Awesome < Sinatra::Application
    
    get '/' do
      erb :index
    end

    helpers do 
      def simple_partial(template)
        erb template
      end
    end

  end
end

