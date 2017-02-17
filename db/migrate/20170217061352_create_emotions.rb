class CreateEmotions < ActiveRecord::Migration[5.0]
  def up
    create_table :emotions do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end

  def down
  	drop_table :emotions
  end
end
