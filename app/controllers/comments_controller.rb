class CommentsController < ApplicationController
    before_action :find_post, only: [:show, :create, :edit, :update, :destroy]

    def index
        @comments = Comment.all.order('created_at ASC')
    end

    def create
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        puts current_user.email
        puts @comment.user.email

        if @comment.save
            flash[:success] = 'Your comment was added to the post'
            redirect_to post_path(@post)
        else
            flash.now[:error] = 'Something went wrong. Your comment was not added to the post'
            render 'posts/show'
        end
    end

    def edit
        @comment = @post.comments.find(params[:id])
    end

    def update
        @comment = @post.comments.find(params[:id])

        if @comment.update(comment_params)
            flash[:success] = 'Your comment was successfully updated'
            redirect_to post_path(@post)
        else
            flash.now[:error] = 'Something went wrong. Your comment was not updated'
            render 'posts/show'
        end
    end

    def destroy
        @comment = @post.comments.find(params[:id])

        if @comment.destroy
            flash[:success] = 'Your comment was successfully removed from this post'
            redirect_to post_path(@post)
        else
            flash.now[:error] = 'Something went wrong. Your comment was not removed'
            render 'posts/show'
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:comment_text)
    end

    def find_post
        @post = Post.find(params[:post_id])
    end
end
