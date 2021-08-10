class CreateMeasures < ActiveRecord::Migration[6.1]
  def change
    create_table :measures do |t|
      t.string :category

      t.timestamps
    end
  end
end
