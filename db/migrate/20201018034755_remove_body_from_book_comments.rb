class RemoveBodyFromBookComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :book_comments, :body, :text
  end
end
