class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable,
		:confirmable

	validates :agreement, acceptance: { accept: true }, on: :update, if: ->{password_confirmation.blank?}

	validates :family_name, :given_name, :tel, :zipcode, :address, presence: true, on: :update, if: ->{password_confirmation.blank?}

	# Setup accessible (or protected) attributes for your model
	# attr_accessible :email, :password, :password_confirmation, :remember_me
end
