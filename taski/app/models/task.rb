class Task < ApplicationRecord
  belongs_to :project
  after_save :updated_percent_completed if :mark_completed?
  scope :completed, -> {where(completed: true)}

  def :mark_completed?
    self.completed === true
  end

  def updated_percent_completed
    project  = Project.find(self.project_id)
    count_of_completed_task = project.tasks.completed.count
    count_of_total_tasks = project.tasks.count
    project.update!(percent_complete: Counter.calculate_percent_complete(calculate_percent_complete, calculate_percent_complete))
  end
end
