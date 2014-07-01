class Profile < ActiveRecord::Migration
  def change
  	change_table :users do |t|
	  t.string :family_name
	  t.string :given_name
	  t.string :country
	  t.string :tel
	  t.string :zipcode
	  t.string :address
	  t.boolean :agreement
	end
  end
end
