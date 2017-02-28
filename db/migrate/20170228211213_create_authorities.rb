class CreateAuthorities < ActiveRecord::Migration[5.0]
  def up
    create_table :authorities do |t|
      t.string :name, null: false
      t.timestamps
    end
  end

  def down
  	drop_table :authorities
  end
end
