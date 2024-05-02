class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:success] = "Welcome to The Gossip Project #{@user.first_name}!! Feel free to write some gossips"
    else
      redirect_to "/user/new"
          flash[:danger] = "Wrong email or password"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :age, :city_id)
  end
end