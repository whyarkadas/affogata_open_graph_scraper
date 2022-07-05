FactoryBot.define do
  factory :open_graph_entity do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end