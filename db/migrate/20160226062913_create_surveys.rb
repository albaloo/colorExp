class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :first
      t.string :second

      t.timestamps null: false
    end
  end
end
