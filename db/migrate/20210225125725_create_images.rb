class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.references :image_class, null: false, foreign_key: true
      t.string :url, null: false

      t.timestamps
    end
  end
end
