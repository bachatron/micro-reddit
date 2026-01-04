class CommentsController < ApplicationController
    def create
        Rails.logger.debug params.inspect
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.user_id = 1

        if @comment.save
            redirect_to post_path(@post)
        else
            render "posts/show"
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end
end
