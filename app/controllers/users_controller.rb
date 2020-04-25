class UsersController < ApplicationController
    
  def user_params
    params.require(:user).permit(:firstname, :lastname, :usertype)
  end
  def edit
    @user = User.find params[:id]
    p params
    p @user
  end

  def update
    @user = User.find params[:id]
    p @user
    @user.update_attributes(user_params)
    flash[:notice] = "#{@user.firstname} was successfully updated."
    redirect_to dashboard_index_path(@user)
  end

end