class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :title
      t.text :tutorial
      t.text :instruction
      t.integer :number
      t.text :answer

      t.timestamps null: false
    end
  end
end
