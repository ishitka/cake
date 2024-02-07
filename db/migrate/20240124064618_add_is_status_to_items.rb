class AddIsStatusToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :is_status, :integer
  end
end
