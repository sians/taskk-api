class Tasks::UpdateService < BaseService
  attr_accessor :title
  attr_accessor :complete
  attr_accessor :completed_on
  attr_accessor :archived
  attr_accessor :panel_id

  attr_accessor :task

  validates :task, presence: true

  def call_after_validation
    update_task

    valid?
  end

  private

  def update_task
    panel = Panel.where(id: panel_id).first

    return if @panel_id && panel.nil?

    task_data = present_update_attrs(Task)

    task.update(task_data)
    task.panel = panel if panel
    task.save
  end

  def valid?
    return false unless super

    clone_errors(@task) if @errors.empty?

    @errors.empty?
  end
end

