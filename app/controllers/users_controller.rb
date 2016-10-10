class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
  end
  
  def new
  	@user = User.new
  end
  def create
  	if @user = User.find_by(email: user_params[:email])
  		if !!@user.authenticate('password')
  			@user.update_attributes(user_params)
	      log_in @user
	      flash[:success] = "Welcome to the City Room App!"
	      redirect_to @user
  		end
  	else
  		puts 'yeah' * 90
			@user = User.new(user_params)
	    if @user.save
	      log_in @user
	      flash[:success] = "Welcome to the City Room App!"
	      redirect_to @user
	    else
	      render 'new'
	    end
	  end
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
