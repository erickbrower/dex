class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      flash[:success] = 'The new user was created successfully!'
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
