class PostsController < ApplicationController

  before_filter :find_post, :only => [:edit, :update, :show, :destroy]
  def index
      @posts = Post.all
      respond_to do |format|
        format.html  #index.html.erb
        format.json {render :json => @posts}
      end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path 
      else
        render :new
      end

  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
     # @post = Post.find(params[:id])
     if @post.update_attributes(post_params)
      redirect_to @post, :notice => 'Post updated successfully'
     else
      render :edit
     end

  end

  def show
    # @post = Post.find(params[:id])
  end

  def destroy
    # @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private 
    def post_params
      params.require(:post).permit(:name, :title, :context)
    end 


    private
      def find_post
        @post = Post.find(params[:id])
      end 

end
