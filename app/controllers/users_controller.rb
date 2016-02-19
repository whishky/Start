class UsersController < ApplicationController
  
	require 'geokit'
	include Geokit::Geocoders
	
	def search
	end
	
	def find
		@location = MultiGeocoder.geocode(params[:location])
		@results = execute_sql("SELECT id, ( 3959 * acos( cos( radians(#{@location.lat}) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(#{@location.lng}) ) + sin( radians(#{@location.lat}) ) * sin( radians( lat ) ) ) ) AS distance FROM lawyers HAVING distance < 25 ORDER BY distance LIMIT 0 , 20;")
		render 'result'
	end
	
	def result
		render 'search'
	end

end
