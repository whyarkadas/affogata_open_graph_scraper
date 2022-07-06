class OpenGraphEntity < ApplicationRecord
  validates :title, :description, presence: true
  validates :url, uniqueness: true

  alias_attribute :type, :entity_type
end
