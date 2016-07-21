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
		Post.create(name:params[:name],content:params[:content])
		redirect to '/posts'
	end

	get '/posts' do
		@posts = Post.all
		erb :posts
	end

	get '/posts/:id' do
		@post = Post.find_by(id:params[:id])
		erb :show
	end

	get '/posts/:id/edit' do
		@id = params[:id].to_i
		@post = Post.find_by(id:params[:id])
		erb :edit
	end

	patch '/posts/:id' do
		#binding.pry
		Post.find_by(id:params[:id]).update(name:params[:name],content:params[:content])
		redirect to '/posts/' + params[:id].to_s
	end

	delete '/posts/:id/delete' do
		@post = Post.find_by(id:params[:id])
		tmp = @post.name
		@post.destroy
		"#{tmp} was deleted"
		#redirect to '/posts'
	end

end
