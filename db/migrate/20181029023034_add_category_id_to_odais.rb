class AddCategoryIdToOdais < ActiveRecord::Migration[5.0]
  def change
    add_column :odais, :category_id, :integer
  end
end
