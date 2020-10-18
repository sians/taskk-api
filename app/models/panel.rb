class Panel < ApplicationRecord
  belongs_to :colortheme
  belongs_to :user

  has_many :tasks
end
