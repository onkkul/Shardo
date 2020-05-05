class PostsController < ApplicationController
    
  def post_params
    params.require(:post).permit(:title, :ingredients, :location, :image, :quantity, :post_age, :owner)
  end

  def create
    @post = Post.create!(post_params)
    flash[:notice] = "#{@post.title} was successfully created." 
    redirect_to dashboard_index_path 
  end
  
  def new
    # default: render 'new' template
    @user=User.find(params[:user_id])
  end
  
  def edit
    @post = Post.find params[:id]
    p params
    p @post
  end

  def update
    @post = Post.find params[:id]
    p @post
    @post.update_attributes(post_params)
    flash[:notice] = "#{@post.title} was successfully updated."
    redirect_to dashboard_index_path(@user)
  end
end