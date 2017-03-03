class AddAppIdToInvitations < ActiveRecord::Migration[5.0]
  def change
  	add_column :invitations, :app_id, :integer, null:false
  end
end
