class AddKeyToEmoBlocks < ActiveRecord::Migration[5.0]
  def change
  	add_column :emo_blocks, :key, :string, null: false, default: "undefined"
  end
end
