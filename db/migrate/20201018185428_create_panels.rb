class CreatePanels < ActiveRecord::Migration[6.0]
  def change
    create_table :panels do |t|
      t.string :title
      t.references :colortheme, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
