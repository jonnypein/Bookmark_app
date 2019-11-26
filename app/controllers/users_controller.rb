class UsersController < ApplicationController

  def index
    if params[:query].present?
      @users = User.all.search_by_first_name_and_last_name(params[:query])
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to user_path(@user)
  end
end
