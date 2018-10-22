class CreateOdais < ActiveRecord::Migration[5.0]
  def change
    create_table :odais do |t|
      t.text :title
      t.text :image
      t.timestamps
    end
  end
end
