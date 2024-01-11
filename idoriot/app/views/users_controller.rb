class UsersController < ApplicationController
  def new; end

  def create
    user = User.create(params[:username], params[:password])
    session[:user_id] = user.id
    redirect_to user_path(user.id)
  end
end
