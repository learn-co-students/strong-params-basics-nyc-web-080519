class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
		@post = Post.find(params[:id])
	  @post.update(post_var_args(:title))
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])

	end


private
	def post_var_args(*args)
		params.require(:post).permit(*args)
	end

	def post_params
		params.require(:post).permit(:title, :description)
	end

end