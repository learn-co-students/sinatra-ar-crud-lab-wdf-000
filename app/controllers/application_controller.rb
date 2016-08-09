require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    # process and save a post to database
    @post = Post.create_post(params[:post])
    @posts = Post.all
    erb :posts
  end

  get '/posts' do
    @posts = Post.all
    # binding.pry
    erb :posts
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post.update(params[:post])
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post.destroy
    @delete_message = "#{@post[:name]} was deleted"
    @posts = Post.all
    erb :posts
  end

end