class CreateStars < ActiveRecord::Migration[5.0]
  def change
    create_table :stars do |t|
      t.references :user,null: false, foreign_key: true
      t.references :boke,null: false, foreign_key: true
      t.integer :status
      t.timestamps
    end
  end
end
