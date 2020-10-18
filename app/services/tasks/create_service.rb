class Tasks::CreateService < BaseService
  attr_accessor :title
  attr_accessor :complete
  attr_accessor :completed_on
  attr_accessor :archived
  attr_accessor :user_id
  attr_accessor :panel_id

  attr_accessor :task

  validates :user_id, presence: true
  validates :panel_id, presence: true

  def call_after_validation
    create_task

    valid?
  end

  private

  def create_task
    user = User.where(id: user_id).first
    panel = Panel.where(id: panel_id).first

    return unless user && panel

    @task = Task.create(
      title: @title,
      complete: @complete,
      completed_on: @completed_on,
      archived: @archived,
      user: user,
      panel: panel,
    )
  end

  def valid?
    return false unless super

    clone_errors(@task) if @errors.empty?

    @errors.empty?
  end
end

