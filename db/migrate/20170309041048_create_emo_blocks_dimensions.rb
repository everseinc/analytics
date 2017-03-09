class CreateEmoBlocksDimensions < ActiveRecord::Migration[5.0]
  def change
    create_table :emo_blocks_dimensions do |t|
      t.integer :emo_block_id, null: false
      t.integer :dimension_id, null: false
      t.timestamps
    end

    execute "ALTER TABLE `emo_blocks_dimensions` ADD FOREIGN KEY (`emo_block_id`) REFERENCES `emo_blocks` (`id`) ON DELETE CASCADE;"
    execute "ALTER TABLE `emo_blocks_dimensions` ADD FOREIGN KEY (`dimension_id`) REFERENCES `dimensions` (`id`) ON DELETE CASCADE;"
  end
end
