class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true
      t.references :competition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
