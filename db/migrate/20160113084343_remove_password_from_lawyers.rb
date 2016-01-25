class RemovePasswordFromLawyers < ActiveRecord::Migration
  def change
    remove_column :lawyers, :password, :string
  end
end
