require_relative '../../config/environment'
require 'pry'

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

  post '/posts' do
    Post.create(name: params[:name], content: params[:content] )
      erb :posts
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do |n|
    i = n.to_i
    @post = Post.all.find(i)
    erb :show
  end

  get "/posts/:id/edit" do |n|
    i = n.to_i
    @post = Post.all.find(i)
    erb :edit
  end

  patch "/posts/:id" do
    i = params[:id].to_i
    @post = Post.all.find(i)
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{@posts.id}"
  end

  delete '/posts/:id/delete' do
      # @post = Post.all.find(params[:id].to_i)
      # erb :deleted
      # Post.all.delete(params[:id].to_i)
      @post = Post.find_by(id: params[:id])
      @post.delete
      erb :deleted
  end

end
