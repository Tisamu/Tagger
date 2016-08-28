class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Mount the carrierwave uploader
  mount_uploader :avatar, AvatarUploader

  validates_format_of :username, with: /\A.[^<>]+\z/

  validates :username, presence: true, on: :create

end
