class RemoveRetypePasswordFromLawyers < ActiveRecord::Migration
  def change
    remove_column :lawyers, :retype_password, :string
  end
end
