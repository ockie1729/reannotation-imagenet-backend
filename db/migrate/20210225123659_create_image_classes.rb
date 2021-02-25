class CreateImageClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :image_classes do |t|
      t.string :name
      t.string :synset, null: false, unique: true

      t.timestamps
    end
  end
end
