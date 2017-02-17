class CreateEmoBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :emo_blocks do |t|
      t.integer :project_id, null: false
      t.integer :dimension_id
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end

    execute "ALTER TABLE `emo_blocks` ADD FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;"
  end
end
