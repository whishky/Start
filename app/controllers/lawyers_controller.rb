class LawyersController < ApplicationController	
	def index
		render 'new'
	end
	
	def new
	end

	def create
		@lawyer = Lawyer.new(lawyer_params)
	#	params[:lawyer][:password] = params[:lawyer][:password].crypt("1$1}")
	#	params[:lawyer][:retype_password] = params[:lawyer][:retype_password].crypt("1$1}")
		print 'Are bhai ', 'password => ' ,params[:lawyer][:password], 'Name => ', params[:lawyer][:name], 'DOB => ' , params[:lawyer][:dob]
		if params[:lawyer][:password] == params[:lawyer][:retype_password] 
		       if @lawyer.save
				redirect_to @lawyer
			else	
				render 'new'
			end
		else
			render 'new'
		end
	end

	def show
		@lawyer = Lawyer.find(params[:id])
	end

	private

	def lawyer_params
		params.require(:lawyer).permit(:name, :email_id, :college_name, :qualification, :gender, :dob, :experience, :mobile_no, :username, :password, :retype_password)
	end
end
