class UsersController < ApplicationController
  def new; end

  def create
    if params[:username].blank? || params[:password].blank?
      redirect_to register_path, alert: 'Username and password cannot be blank'
      return
    end

    if User.find_by_username(params[:username])
      redirect_to register_path, alert: 'Username already taken'
      return
    end

    user = User.create(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: 'User successfully created'
    else
      redirect_to register_path, alert: 'Error creating user'
    end
  end

  def show
    if params[:id] == nil.to_i.to_s
      render plain: ENV["FLAG"]
    else
      @user = User.find_by_id(params[:id])

      if @user
        render :show
      else
        redirect_to root_path, alert: 'User not found'
      end
    end
  end
end
