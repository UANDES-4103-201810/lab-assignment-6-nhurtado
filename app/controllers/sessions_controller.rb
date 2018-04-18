class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_email(session_params[:email])
		if @user != nil
			if @user.password == session_params[:password]
				session[:current_user_id] = @user.id
	      		flash[:notice] = "Login Successful!"
				redirect_to user_url(@user)
			else
				flash[:notice] = "Wrong password."
      			redirect_to root_url
			end
		else
			flash[:notice] = "Invalid email."
      		redirect_to root_url
		end
	end

	def destroy
		session[:current_user_id] = nil
		redirect_to root_url
	end

	private
	def session_params
		params.require(:session).permit(:email, :password)
	end
end
