
class PostsController < ApplicationController
    # include CommonStuff
    http_basic_authenticate_with name: "thor", password: "12345",  except:[:index,:show]

    before_action :set_post, only: [:show]

    def index
        @posts = Post.all.order('created_at DESC')
    end


    def show
        @post = @Post
        @comments = @post.comments
    end


    def new
        @post = Post.new
    end

    def create
        #render plain: params[:posts].inspect

        @post = Post.new(post_params)

        if(@post.save)
            redirect_to @post
        else
            render 'new'
        end

    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if(@post.update(post_params))
            redirect_to @post
        else
            render 'edit'
        end
    end

    private def post_params
        params.require(:post).permit(:title,:body)
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end


    def set_post
        @Post = Post.find(params[:id])
    end
end
