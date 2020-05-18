class PostsController < ApplicationController

  def post_params
    params.require(:post).permit(:title, :ingredients, :location, :image, :quantity, :post_age, :user_id)
  end

  def index
    @user=User.find(params[:user_id])
    @posts = Post.all
    # post_array = Array.new
    # @posts.each do |p|
    #   @post = p
    #   if @post.created_at - @post.post_age > Time.now
    #     post_array.insert(0, @post)
    #   end
    # end
    #@posts =  Post.all.collect{|s| s.created_at - s.post_age}
    #get the posts with post age still valid
    p @posts
    # return post_array
  end
  
  def create
    @post = Post.create!(post_params)
    users =User.where(usertype: "student")
    users.each do |t|
      @user = t
      UserMailer.post_notification(@user).deliver
    end
    flash[:notice] = "#{@post.title} was successfully created." 
    redirect_to user_posts_path
  end

  def new
    # default: render 'new' template
    @user=User.find(params[:user_id])
    @post= Post.new
  end

  def edit
    @post = Post.find params[:id]
    p params
    p @post
  end

  def get_all
    
  end


  def update
    @post = Post.find params[:id]
    p @post
    @post.update_attributes(post_params)
    flash[:notice] = "#{@post.title} was successfully updated."
    redirect_to dashboard_index_path(@user)
  end

end