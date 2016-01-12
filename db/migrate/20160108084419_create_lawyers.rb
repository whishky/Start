class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string :email_id
      t.string :college_name
      t.string :qualification
      t.string :gender
      t.string :dob
      t.string :experience
      t.string :mobile_no
      t.string :username
      t.string :password
      t.string :retype_password

      t.timestamps null: false
    end
  end
end
