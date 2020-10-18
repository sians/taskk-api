class CreateColorthemes < ActiveRecord::Migration[6.0]
  def change
    create_table :colorthemes do |t|
      t.string :primary_color
      t.string :secondary_color
      t.string :tertiary_color
      t.string :name

      t.timestamps
    end
  end
end
