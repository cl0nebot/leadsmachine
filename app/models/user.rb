class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [
  	:prospect,
  	:client,
  	:inactive,
  	:staff,
  	:admin
  ]

  scope :available, ->{ where(user_id: nil) } 

  has_many :charges
  has_many :companies
  has_many :machines
  has_many :properties, as: :prop
  has_many :subscriptions
end
