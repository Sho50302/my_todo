class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,           presence: true, length: {maximum: 20}
  validates :email,              presence: true, uniqueness: true, format: {with: /\A[a-zA-Z0-9_#!$%&`'*+-{|}~^\/=?.]+@[a-zA-Z0-9][a-zA-Z0-9.-]+\z/}
  validates :encrypted_password, presence: :true, length: {minimum: 7}, format: {with: /\A(?=.*?[a-z])(?=.*?\d)(?=.*?[!-\/:-@\[-`{-~])[!-~]{7,100}+\z/i}
  

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :tasks, dependent: :destroy

  mount_uploader :user_image, UserImageUploader

end


