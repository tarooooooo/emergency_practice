class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :entry, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :contest, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :contest_id], unique: true
      t.index [:user_id, :entry_id], unique: true
    end
  end
end
