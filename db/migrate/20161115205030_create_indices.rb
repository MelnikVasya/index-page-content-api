class CreateIndices < ActiveRecord::Migration[5.0]
  def change
    create_table :indices do |t|
      t.string :url, null: false
      t.jsonb  :tags, null: false, default: {}

      t.timestamps
    end
  end
end
