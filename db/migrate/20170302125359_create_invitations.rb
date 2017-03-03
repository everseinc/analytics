class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
    	t.string :email, null: false, unique: true
    	t.string :uuid, null: false, unique:true
    	t.datetime :limited_at
      t.timestamps
    end
  end
end
