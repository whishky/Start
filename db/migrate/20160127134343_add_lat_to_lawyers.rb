class AddLatToLawyers < ActiveRecord::Migration
  def change
    add_column :lawyers, :lat, :string
    add_column :lawyers, :lng, :string
  end
end
