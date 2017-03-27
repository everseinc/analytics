class AddUpidToProjects < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :upid, :string, null: false, default: "undefined"
  end
end
