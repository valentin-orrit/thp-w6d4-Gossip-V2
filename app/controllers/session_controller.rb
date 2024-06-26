class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
        puts "SUCCESS!"
        session[:user_id] = @user.id
        redirect_to root_path
        flash[:success] = "Welcome #{@user.first_name}!!"
    else
      puts params[:password]
      puts "$" * 50
      redirect_to "/session/new"
      flash[:danger] = "Wrong email or password"
    end
  end

  def delete
    session.delete(:user_id)
    redirect_to root_path
  end  

  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
