class TaskSerializer < BaseSerializer
  attribute :title
  attribute :complete
  attribute :completed_on
  attribute :archived

  belongs_to :user
  belongs_to :panel
end
