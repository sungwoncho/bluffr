class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_length_of :username, maximum: 15
  validates_uniqueness_of :username
  validates_format_of :username, with: /\A[-a-z\d_]+\z/i

  has_many :likes, dependent: :destroy
  has_many :liked_bluffs, through: :likes, source: :bluff
  has_many :authored_bluffs, class_name: 'Bluff', dependent: :destroy
end
