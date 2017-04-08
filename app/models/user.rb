class User < ActiveRecord::Base
  has_many :contributors
  has_many :projects, through: :contributors
  validates :first_name, presence: true
  validates :last_name, presence: true
end
