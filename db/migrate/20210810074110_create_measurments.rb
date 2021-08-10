class CreateMeasurments < ActiveRecord::Migration[6.1]
  def change
    create_table :measurments do |t|
      t.string :category

      t.timestamps
    end
  end
end
