class AddAndChangeCoumn < ActiveRecord::Migration
  def change
    add_column :questions, :body, :string, null: false
    rename_column :questions, :question, :title
  end
end
