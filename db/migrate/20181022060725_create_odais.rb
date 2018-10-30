class CreateOdais < ActiveRecord::Migration[5.0]
  def change
    create_table :odais do |t|
      t.text :title,null: false
      t.text :image,null: false
      t.references :user,null: false, foreign_key: true
      t.timestamps
    end
  end
end
