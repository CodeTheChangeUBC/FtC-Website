class CreateFundraisers < ActiveRecord::Migration[5.0]
  def change
    create_table :fundraisers do |t|
      t.integer :target
      t.integer :progress

      t.timestamps
    end
  end
end
