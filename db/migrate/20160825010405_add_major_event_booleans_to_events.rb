class AddMajorEventBooleansToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :ee_challenge, :boolean, default: false
    add_column :events, :vow_silence, :boolean, default: false
    add_column :events, :we_day, :boolean, default: false
  end
end
