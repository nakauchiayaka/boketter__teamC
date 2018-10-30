class CreateBokes < ActiveRecord::Migration[5.0]
      def change
    create_table :bokes do |t|
      t.references :user,null: false, foreign_key: true
      t.references :odai,null: false, foreign_key: true
      #t.references :tag,null: false, foreign_key: true
      t.references :tag
      t.text :text,null: false
      t.timestamps
    end
  end
end
