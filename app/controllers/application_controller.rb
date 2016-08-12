require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect "/posts"
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)

    erb :posts
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    post_id = params[:id]
    @post = Post.find_by(id: post_id)

    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post.update(name: params[:name], content: params[:content])

    redirect "/posts/#{@posts.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    Post.delete(params[:id])

    erb :deleted_post

  end
end
