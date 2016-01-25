class SessionsController < ApplicationController
  def new
  end

  def create
  	lawyer = Lawyer.find_by(email_id: params[:session][:email_id].downcase)
	if lawyer && lawyer.authenticate(params[:session][:password])
		log_in lawyer
		params[:session][:remember_me] == '1' ? remember(lawyer) : forget(lawyer)
		redirect_to lawyer	
	else
		render 'new'
	end
  end

  def destroy
  	logout
	redirect_to root_url
  end

end
