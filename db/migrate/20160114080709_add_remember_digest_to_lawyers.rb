class AddRememberDigestToLawyers < ActiveRecord::Migration
  def change
    add_column :lawyers, :remember_digest, :string
  end
end
