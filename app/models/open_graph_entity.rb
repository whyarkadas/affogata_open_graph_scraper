class OpenGraphEntity < ApplicationRecord
  validates :title, :description, presence: true
end
