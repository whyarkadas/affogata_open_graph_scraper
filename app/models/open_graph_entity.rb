class OpenGraphEntity < ApplicationRecord
  validates :title, :description, presence: true
  alias_attribute :type, :entity_type
end
