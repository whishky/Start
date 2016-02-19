class ChangeLatTypeInLawyers < ActiveRecord::Migration
  def change
	  change_column :lawyers, :lat, :float
	  change_column :lawyers, :lng, :float
  end
end
