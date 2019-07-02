class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all.order('created_at DESC')
    end

    def show
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
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            flash[:success] = 'Post successfully updated!'
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        flash[:success] = 'Post successfully deleted!'
        redirect_to '/posts'
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :user)
    end

    def find_post
        @post = Post.find_by(id: params[:id])
    end
end
