class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :f_adress, :f_postnumber, :f_county, :l_adress, :l_postnumber, :l_county, :name, :aftername, :phone
  validates_presence_of :email, :password, :f_adress, :f_postnumber, :f_county, :l_adress, :l_postnumber, :l_county, :name, :aftername, :phone, on: :create
end
