class AddPasswordDigestToLawyers < ActiveRecord::Migration
  def change
    add_column :lawyers, :password_digest, :string
  end
end
