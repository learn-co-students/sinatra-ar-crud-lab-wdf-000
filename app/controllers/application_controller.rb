require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do  # => render new.erb
    erb :'posts/new'
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :'posts/show'
  end

  post '/posts' do   # => create new post
    @post = Post.create(name: params[:name], content: params[:content])
    @post.save
    redirect to('/posts')
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end


  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :'posts/edit'
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :'posts/show'
  end

  delete '/posts/:id/delete' do
    # binding.pry
    @post = Post.find_by(id: params[:id])
    @post_id = Post.delete(params[:id])
    erb :'posts/delete'
  end
end
