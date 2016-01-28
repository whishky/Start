class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def execute_sql(sql)
	  res = ActiveRecord::Base.connection.execute(sql)
	  if res.present?
		  return res
	  else
		  return nil
	  end
  end
end
