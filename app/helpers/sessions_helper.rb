module SessionsHelper
	def log_in(lawyer)
			session[:lawyer_id] = lawyer.id
	end	
	
	def forget(lawyer)
		lawyer.forget
		cookies.delete(:lawyer_id)
		cookies.delete(:remember_token)
	end


	def logout
		forget(current_lawyer)
		session.delete(:lawyer_id)
		@current_lawyer = nil
	end

	def remember(lawyer)
		lawyer.remember
		cookies.permanent.signed[:lawyer_id] = lawyer.id
		cookies.permanent[:remember_token] = lawyer.remember_token
	end

	def current_lawyer
		if(lawyer_id = session[:lawyer_id])
			@current_lawyer ||= Lawyer.find_by(id: session[:lawyer_id])
		elsif (lawyer_id = cookies.signed[:lawyer_id])
			lawyer = Lawyer.find_by(id: lawyer_id)
			if lawyer && lawyer.authenticated?(cookies[:remember_token])
				log_in lawyer
				@current_lawyer = lawyer
			end
		end
	end

	def logged_in?
		!current_lawyer.nil?
	end
end
