class AddStartTimeToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :start_time, :date
  end
end
