class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,           presence: true, length: {maximum: 30}
  validates :email,              presence: true, uniqueness: true
  validates :encrypted_password, presence: :true

  has_many :tasks
  has_many :groups, through: :groups_users
  has_many :groups_users
end
# , format: {with: /\A[a-zA-Z0-9_#!$%&`'*+-{|}~^\/=?.]+@[a-zA-Z0-9][a-zA-Z0-9.-]+\z/}
# , length: {minimum: 7}
