class DropEmoTios < ActiveRecord::Migration[5.0]
  def change
  end

  def down
    drop_table :emo_tios
  end
end
