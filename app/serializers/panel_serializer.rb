class PanelSerializer < BaseSerializer
  attribute :title

  belongs_to :user
  belongs_to :colortheme

  has_many :tasks
end
