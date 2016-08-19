class AddTitleAndDescriptionToFundraisers < ActiveRecord::Migration[5.0]
  def change
    add_column :fundraisers, :title, :string
    add_column :fundraisers, :description, :text
  end
end
