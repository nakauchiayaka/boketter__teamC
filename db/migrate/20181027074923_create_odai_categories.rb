class CreateOdaiCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :odai_categories do |t|
      t.references :odai,null: false,index: true, foreign_key: true
      t.references :category,null: false,index: true, foreign_key: true
      t.timestamps
    end
  end
end
