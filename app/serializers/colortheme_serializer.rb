class ColorthemeSerializer < BaseSerializer
  attribute :name
  attribute :primary_color
  attribute :secondary_color
  attribute :tertiary_color

  has_many :panels
end
