class Tasks::DestroyService < BaseService
  attr_accessor :task

  validates :task, presence: true

  def call_after_validation
    destroy_task

    valid?
  end

  def destroy_task
    @task.destroy
  end
end
