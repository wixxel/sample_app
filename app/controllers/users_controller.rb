class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params) # not the final implementation

  	if @user.save
  		# add a flash message for symbol :success
  		flash[:success] = "Welcome to the Sample App!"
  		# Handle the save
  		redirect_to @user
  	else
  		# Handle the new user
  		render 'new'
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

end

class UsersController < ApplicationController
  def show
  	@user = User.find_by(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params) # not the final implementation

  	if @user.save
      # sign-in the new user
      sign_in @user
  		# add a flash message for symbol :success
  		flash[:success] = "Welcome to the Sample App!"
  		# Handle the save
  		redirect_to @user
  	else
  		# Handle the new user
  		render 'new'
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

end

