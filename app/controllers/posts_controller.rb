class PostsController < ApplicationController
    def index
      @posts = Post.all.reverse
    end

    def show
      @post = Post.find(params[:id])
      @comment = Comment.new
      @comments = @post.comments
    end

    def new
      @post = Post.new
    end

    def create
      post = Post.new(post_params)
      post.user = current_user

      # Check if save into datebase.
      if post.save!
        redirect_to posts_path
      else
        render :new
      end
    end

    def vote
      @post = Post.find(params[:id])
      @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

      if @vote.valid?
        flash[:success] = 'Your vote was counted!'
      else
        flash[:error] = "You can only vote for #{@post.title} once!"
      end

      redirect_to :back
    end

    private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end