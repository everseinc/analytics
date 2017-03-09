class RemoveDimensionIdFromEmoBlocks < ActiveRecord::Migration[5.0]
  def change
  	remove_column :emo_blocks, :dimension_id
  end
end
