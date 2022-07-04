class OgEntity < ApplicationRecord
  validates :title, :description, presence: true
end
