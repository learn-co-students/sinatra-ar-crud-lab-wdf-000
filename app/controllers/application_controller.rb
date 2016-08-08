require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do 
  #   @posts = Post.all
  #   erb :index
  # end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    # process and save a post to database
    # Should move the creation and saving to models?
    @post = Post.create do |field|
      field.name = params[:post][:name]
      field.content = params[:post][:content]
    end
    @post.save
    # @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/index' do
    @posts = Post.all
    erb :index
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
    @post.name = params[:post][:name]
    @post.content = params[:post][:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @message = "#{@post[:name]} was deleted"
    @post.destroy
    # binding.pry
    erb :show
  end

  get '/show' do
    erb :show
  end

end