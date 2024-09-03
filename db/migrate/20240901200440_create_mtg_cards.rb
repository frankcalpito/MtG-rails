class CreateMtgCards < ActiveRecord::Migration[7.2]
  def change
    create_table :mtg_cards do |t|
      t.string :name
      t.string :set
      t.string :image_url

      t.timestamps
    end
  end
end
