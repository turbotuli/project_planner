class Project < ActiveRecord::Base
  has_many :users
  has_many :users, through: :contributors
  has_many :tasks
  validates :name, presence: true

end
