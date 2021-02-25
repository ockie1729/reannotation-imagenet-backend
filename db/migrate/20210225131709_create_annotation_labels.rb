class CreateAnnotationLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :annotation_labels do |t|
      t.text :explanation, null: false

      t.timestamps
    end
  end
end
