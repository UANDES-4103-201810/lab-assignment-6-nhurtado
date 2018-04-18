class RegistrationsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(registrations_params)
		if @user.save
			flash[:notice] = "User successfully registered."
			redirect_to root_path
		else
			flash[:notice] = "Error registering user."
			render "new"
		end
	end
	private
	def registrations_params
		params.require(:registrations).permit(:name, :last_name, :email, :phone, :password)
	end
end
