class CreteVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.integer :user_id, null: false
    end
    add_index :votes, [:votable_id, :votable_type, :user_id], unique: true
  end
end
