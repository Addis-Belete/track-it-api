class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.decimal :result
      t.references :measurment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
