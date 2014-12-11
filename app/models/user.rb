class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_length_of :username, maximum: 15
  validates_uniqueness_of :username
  validates_format_of :username, with: /\A[-a-z\d_]+\z/i

  has_many :bluffs, dependent: :destroy
end
