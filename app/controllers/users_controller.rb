class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update.attributes user_params
    if @author.save
      redirect_to "/users/#{@user.id}"
    else
      render :edit
    end
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to '/users'
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to "/users"
    else
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:name)
  end

end
