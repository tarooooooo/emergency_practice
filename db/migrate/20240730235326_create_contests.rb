class CreateContests < ActiveRecord::Migration[6.1]
  def change
    create_table :contests do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false

      t.timestamps
    end
  end
end
