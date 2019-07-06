class CommentsController < ApplicationController
    before_action :find_post, only: [:show, :create, :edit, :update, :destroy]

    def index
        @comments = Comment.all.order('created_at ASC')
    end

    def show
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        puts current_user.email
        puts @comment.user.email


        if @comment.save
            flash[:success] = 'Your comment has been added to the post'
            redirect_to post_path(@post)
        else
            flash.now[:error] = 'Something went wrong. Your comment was not added to the post'
            render 'posts/show'
        end
    end

    def update
    end

    def edit
    end

    def destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:comment_text).merge(user: current_user)
    end

    def find_post
        @post = Post.find(params[:post_id])
    end
end
