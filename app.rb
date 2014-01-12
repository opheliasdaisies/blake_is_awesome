require 'bundler'
Bundler.require
require './lib/compliment.rb'


# DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/compliments.db")
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

module Blake
  class Awesome < Sinatra::Application
    
    # MAIN PAGE
    get '/' do
      @compliments = Compliment.all
      @compliments.each do |compliment|
        compliment.format_casing
        compliment.save
      end
      @compliments.save
      erb :index
    end

    # ROUTES FOR CRUD COMPLIMENTS
    get '/compliments' do
      @compliments = Compliment.all
      erb :show
    end

    # page for new compliment
    get '/compliments/new' do
      @compliment = Compliment.new
      erb :new
    end

    # create new compliment 
    post '/compliments' do
      @compliment = Compliment.new(params[:compliment])
      if @compliment.save
        # status 201
        redirect '/compliments'
      else
        # status 400
        erb :new
      end
    end

    # edit compliment
    get '/compliments/edit/:id' do
      @compliment = Compliment.get(params[:id])
      erb :edit
    end

    # update compliment
    put '/compliments/:id' do
      @compliment = Compliment.get(params[:id])
      if @compliment.update(params[:compliment])
        # status 201
        redirect '/compliments'
      else
        # status 400
        erb :edit  
      end
    end

    # delete compliment confirmation
    get '/compliments/delete/:id' do
      @compliment = Compliment.get(params[:id])
      erb :delete
    end

    # delete compliment
    delete '/compliments/:id' do
      Compliment.get(params[:id]).destroy
      redirect '/compliments'  
    end

    helpers do 
      def simple_partial(template)
        erb template
      end
    end

  end
end

DataMapper.auto_upgrade!