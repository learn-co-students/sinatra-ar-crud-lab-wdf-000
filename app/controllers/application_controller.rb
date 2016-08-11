require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #
  # end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    # binding.pry
    erb :posts
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    # binding.pry
    erb :show
  end
end
