class AddUserIdToOdais < ActiveRecord::Migration[5.0]
  def change
    add_column :odais, :user_id, :integer
  end
end
