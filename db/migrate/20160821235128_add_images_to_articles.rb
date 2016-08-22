class AddImagesToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :image1, :string
    add_column :articles, :image2, :string
    add_column :articles, :image3, :string
    add_column :articles, :image4, :string
  end
end
