class AddIndexToLawyersEmailId < ActiveRecord::Migration
  def change
	  add_index :lawyers, :email_id, unique: true
  end
end
