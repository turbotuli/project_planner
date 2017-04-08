class Project < ActiveRecord::Base
  has_many :users
  has_many :users, through: :contributors
  validates :name, presence: true

end
