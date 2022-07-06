class CreateOpenGraphEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :open_graph_entities do |t|
      t.string :url
      t.string :entity_type
      t.string :title
      t.text :description
      t.text :images, array: true, default: []

      t.timestamps
    end
  end
end
