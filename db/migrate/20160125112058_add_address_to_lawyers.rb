class AddAddressToLawyers < ActiveRecord::Migration
  def change
    add_column :lawyers, :address, :string
  end
end
