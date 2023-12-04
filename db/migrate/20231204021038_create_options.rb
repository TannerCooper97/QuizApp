class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :description
      t.string :part1
      t.string :part2
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
