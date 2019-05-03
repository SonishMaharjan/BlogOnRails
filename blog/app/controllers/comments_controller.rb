class CommentsController < ApplicationController

	http_basic_authenticate_with name: "ruby", password: "12345",  only:[:destroy]

	before_action :set_post, only: [:create,:new, :get_comments]




	def create
		 @comment = @Post.comments.create(comment_params)
         # if(@comment.save)
            
         redirect_to post_path(@Post)
        # else
        # 	@post = @Post
        #     render :template => "posts/show", :collection =>@post
        # end

        
        
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)	
	end


	def get_comments
		@comments = @Post.comments 
	end


	private 
	def comment_params
		params.require(:comment).permit(:username,:body)
	end

	def set_post 
		@Post = Post.find(params[:post_id])
	end

end
