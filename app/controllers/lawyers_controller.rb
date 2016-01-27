class LawyersController < ApplicationController	
	
	require 'geokit'
	include Geokit::Geocoders

	def index
		render 'new'
	end
	
	def new
	end
	
	def edit
		@lawyer = Lawyer.find(params[:id])
	end

	def create
		@lawyer = Lawyer.new(lawyer_params)
	#	params[:lawyer][:password] = params[:lawyer][:password].crypt("1$1}")
	#	params[:lawyer][:retype_password] = params[:lawyer][:retype_password].crypt("1$1}")
		if @lawyer.save
			log_in @lawyer
			redirect_to @lawyer
		else	
			render 'new'
		end
	end

	def show
		@lawyer = Lawyer.find(params[:id])
		@loc = MultiGeocoder.geocode(@lawyer.address)
	end
	
	def update
		@lawyer = Lawyer.find_by_id(params[:id])
		flg = true
		params[:lawyer].each do |key, value|
			if @lawyer.update_attribute(key , value)
				flg &= true
			else
				flg &= false
			end
		end

		if flg
			redirect_to @lawyer
		else
			redirect_to 'edit'
		end
	end

	private

	def lawyer_params
		params.require(:lawyer).permit(:name, :email_id, :address, :college_name, :qualification, :gender, :dob, :experience, :mobile_no, :username, :password, :password_confirmation)
	end

	def lawyer_edit_params
		params.require(:lawyer).permit(:name, :email_id, :address, :college_name, :qualification, :gender, :dob, :experience, :mobile_no)
	end
end
