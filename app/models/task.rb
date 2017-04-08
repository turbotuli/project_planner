class Task < ActiveRecord::Base
  belongs_to :project
  validates :name, presence: true
  validate :due_date, :must_be_future_date
  validates :project_id, numericality: true

  def must_be_future_date
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "cant be in the past")
    end
  end
end
