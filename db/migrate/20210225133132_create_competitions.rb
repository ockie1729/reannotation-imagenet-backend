class CreateCompetitions < ActiveRecord::Migration[6.1]
  def change
    create_table :competitions do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.string :title
      t.text :explanation

      t.timestamps
    end
  end
end
