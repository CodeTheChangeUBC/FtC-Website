class AddUrlToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :url, :string
  end
end
