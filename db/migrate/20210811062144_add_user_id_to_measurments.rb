class AddUserIdToMeasurments < ActiveRecord::Migration[6.1]
  def change
    add_column :measurments, :user_id, :int
  end
end
