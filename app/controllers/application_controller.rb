require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/posts/new' do
    @session = session
    erb :new
  end

  post '/posts' do
    @session = session
    Post.create(name: params["name"], content: params["content"])
    redirect '/posts'
  end

  get '/posts' do
    @session = session
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params["id"])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params["id"])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params["id"])
    Post.update(@post.id, :name => params["name"], :content => params["content"])
    redirect "/posts/#{params["id"]}"
  end

  delete '/posts/:id/delete' do
    post = Post.find_by(id: params["id"])
    session[:deleted_post] = post.name
    @session = session
    Post.delete(post.id)
    redirect '/posts'
  end
end
