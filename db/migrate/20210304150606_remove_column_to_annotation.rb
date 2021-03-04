class RemoveColumnToAnnotation < ActiveRecord::Migration[6.1]
  def change
    remove_column :annotations, :image_id
  end
end
