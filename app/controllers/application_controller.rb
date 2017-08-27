require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    
  end

  get '/posts/new' do 
  	erb :new
  end
# this is a get request and the user visits this page and renders the form which is in the new template 
  post '/posts' do 
    Post.create(params) #This creates a new post
  	# @post = Post.create(params)
  	redirect '/posts' #this is submitting a get request... when you redirect you lose scope and therefore the variable
  end

  get '/posts' do
  	@posts = Post.all
    # binding.pry 
  erb :index 
  end

  get '/posts/:id' do 
    @post = Post.find(params[:id])
    # binding.pry
    erb :show
  end

  get '/posts/:id/edit' do 
    @post = Post.find(params[:id])
    # binding.pry
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(:name => params[:name], :content => params[:content])
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do 
    @post = Post.find(params[:id])
    @post.destroy
    erb :deleted
  end

end