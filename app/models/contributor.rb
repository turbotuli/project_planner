class Contributor < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates :user_id, numericality: true
  validates :project_id, numericality: true

end
