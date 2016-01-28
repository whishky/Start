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

#	$Loc = {lat: => nil, lng: => nil}
	def create
		get_Loc_lat_lng
		print "Location lat ", $Loc.lat;
		@lawyer = Lawyer.new(lawyer_params)
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
		address_to_lng_lat
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
	
	def get_Loc_lat_lng
		$Loc = MultiGeocoder.geocode(params[:lawyer][:address])
		print_Loc_lat_lng()
	end

	def print_Loc_lat_lng()
		print "Location lat => ", $Loc.lat
		print "Location lng => ", $Loc.lng 
	end


	def address_to_lng_lat
	       get_Loc_lat_lng() 
	       h1 = {:lat => $Loc.lat}
	       h2 = {:lng => $Loc.lng}
	       params[:lawyer].merge!(h1)
	       params[:lawyer].merge!(h2)
	end
		

	def lawyer_params
		address_to_lng_lat
		params.require(:lawyer).permit(:name, :email_id, :address, :college_name, :qualification, :gender, :dob, :experience, :mobile_no, :username, :password, :password_confirmation, :lat, :lng)
	end

	def lawyer_edit_params
		params.require(:lawyer).permit(:name, :email_id, :address, :college_name, :qualification, :gender, :dob, :experience, :mobile_no)
	end
end
