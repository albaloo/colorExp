class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :level

      t.timestamps null: false
    end
  end
end
