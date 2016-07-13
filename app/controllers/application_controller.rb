require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :'posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :'posts/edit'
  end

  patch '/posts/:id' do 
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :'posts/show'
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post2 = @post
    @post.delete
    erb :'posts/deleted'
  end 

  

end