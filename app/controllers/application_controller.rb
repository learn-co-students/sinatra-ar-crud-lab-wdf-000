require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do                #this route leads to a rendered form page.
    erb :new
  end

  post '/posts' do                  #route posts creates a new istance of posts
    @post = Post.create(params)     #and saves it to the data base. When it is created
    redirect '/posts'               #we want to be able to read the new isntances but to do that
  end                               #we redirect to a get request to posts the same page,
                                    #and we create an instance var set to all the post in the
                                    #post class. we then direct the route to the view page index
  get '/posts' do                   #which displays the content and name for all the posts

    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do                 #this method finds a post by the unique id it is given
    @posts = Post.find(params[:id])  #at the web params. for example a person wants to see the
    erb :show                         #second post
  end                                 #we then use the fidn method and find by the id the person
                                      #enters in the uri and redirect to the show page which displays the disired post name and content.

  get '/posts/:id/edit' do
    @posts = Post.find(params[:id])
    erb :edit
  end


  patch '/posts/:id' do
    @posts = Post.find(params[:id])
    @posts.update(name: params[:name], content: params[:content], id: params[:id])
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy

    erb :deleted
  end






end
