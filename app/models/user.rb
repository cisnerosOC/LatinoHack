class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :information
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :company, :presence => true
  validates :role, :presence => true
  validates :occupation, :presence => true
  has_many :stories
end
