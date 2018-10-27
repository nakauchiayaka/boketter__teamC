class AddCategoryIdToOdais < ActiveRecord::Migration[5.0]
  def change
    add_reference :odais, :category, foreign_key: true,null: false
  end
end
