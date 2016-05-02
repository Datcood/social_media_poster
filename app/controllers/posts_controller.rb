class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.new(post_params)

		respond_to do |format|
			if @post.save
				format.html { redirect_to root_path, notice: "Post was successfully created." }
			else
				format.html { render :new }
			end
		end
	end

	private
	def post_params
		params.require(:post).permit(:content, :scheduled_at, :state, :user_id, :facebook, :twitter)
	end
end
