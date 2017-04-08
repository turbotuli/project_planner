class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :name, presence: true
  validate :due_date, :must_be_future_date
  validates :project_id, numericality: true

  def must_be_future_date
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end
end
