class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @topics = @user.topics
    @liked_bookmarks = @user.likes
  end
end
