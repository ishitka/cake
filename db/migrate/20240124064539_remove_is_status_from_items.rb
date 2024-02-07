class RemoveIsStatusFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :is_status, :boolean
  end
end
