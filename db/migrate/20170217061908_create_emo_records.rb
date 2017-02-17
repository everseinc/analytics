class CreateEmoRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :emo_records do |t|
      t.integer :emo_block_id, null: false
      t.integer :emotion_id, null: false
      t.integer :value, null: false

      t.timestamps
    end

    execute "ALTER TABLE `emo_records` ADD FOREIGN KEY (`emo_block_id`) REFERENCES `emo_blocks` (`id`) ON DELETE CASCADE;"
  end
end
