class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        Rails.logger.debug params.inspect
        @post = Post.new(post_params)
        @post.user_id = 1

        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end
end
