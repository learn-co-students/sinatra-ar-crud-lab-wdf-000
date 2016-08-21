require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "hellow"
  end

  get '/posts/new' do
    erb :new
  end


  post '/posts' do
    # binding.pry

    @name = params[:name]
    @content = params[:content]

    hash = {}
    hash[:name] = @name
    hash[:content] = @content

    @post = Post.create(hash)

    #@post = Post.create(params)
    # erb :index
    #either or
    redirect '/posts'
  end



  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @id = params[:id].to_i - 1
    @post = Post.all[@id]
    # @post = Post.find_by_id(params[:id])
    # binding.pry
    erb :show
  end

  get '/posts/:id/edit' do
    @id = params[:id].to_i - 1
    @post = Post.all[@id]
    # @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.all[(params[:id].to_i - 1)]
    # @post = Post.find_by_id(params[:id])
    @name = params[:name]
    @content = params[:content]
    # binding.pry
    @post.update_attributes(:name => @name, :content => @content)

    # binding.pry
    # redirect '/posts/:id'
    erb :show
  end


  delete '/posts/:id/delete' do
    @post = Post.all[(params[:id].to_i - 1)]
    # @post = Post.find_by_id(params[:id])
    @post.destroy

    erb :view
  end


end
