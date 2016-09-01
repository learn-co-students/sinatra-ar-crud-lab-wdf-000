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

  post '/posts' do
    # binding.pry
    Post.create(params)
    @posts = Post.all
    # binding.pry
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    finder = params[:id].to_i
    @post = Post.find_by(id: finder)
    erb :show
    # binding.pry
  end

  get '/posts/:id/edit' do
    # binding.pry
    finder = params[:id].to_i
    @post = Post.find_by(id: finder)
    erb :edit
  end

  patch '/posts/:id' do
    finder = params[:id].to_i
    @post = Post.find_by(id: finder)
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    # binding.pry
    erb :show
    # erb :edited
  end

  delete '/posts/:id/delete' do
    finder = params[:id].to_i
    @post = Post.find_by(id: finder)
    @post.destroy
    erb :deleted
    # redirect '/posts'
  end

end
