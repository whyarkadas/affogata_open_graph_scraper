FactoryBot.define do
  factory :open_graph_entity do
    title       { Faker::Lorem.sentence }
    url         { Faker::Internet.url }
    description { Faker::Lorem.paragraph }
  end
end