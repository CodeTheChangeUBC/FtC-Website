class AddExecToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :exec, :boolean, default: false
  end
end
