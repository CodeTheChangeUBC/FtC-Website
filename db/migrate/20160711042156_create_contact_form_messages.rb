class CreateContactFormMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_form_messages do |t|
    	t.string :name
    	t.string :email
    	t.string :subject
    	t.string :content

      t.timestamps
    end
  end
end
