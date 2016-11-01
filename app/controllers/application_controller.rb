require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Placeholder text!"
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  patch "/posts/:id" do
    @post = Post.find(params[:id].to_i).update(params)
    erb :show
  end

  delete '/posts/:id/delete' do
    name = Post.find(params[:id].to_i).name
    Post.delete(params[:id].to_i)
    "#{name} was deleted"
  end





end
