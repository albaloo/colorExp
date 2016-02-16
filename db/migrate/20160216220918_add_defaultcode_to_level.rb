class AddDefaultcodeToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :defaultcode, :text
  end
end
