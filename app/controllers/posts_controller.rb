class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all.order('created_at DESC')
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user = current_user

        if @post.save
            flash[:success] = 'Post successfully created!'
            redirect_to @post
        else
            flash.now[:error] = 'Unable to create post. Please try again.'
            render '/posts/new'
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :user)
    end

    def find_post
        @post = Post.find_by(id: params[:id])
    end
end
