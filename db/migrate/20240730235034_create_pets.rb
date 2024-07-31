class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.references :animal, null: false, foreign_key: true
      t.references :breed, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :name_kana, null: true
      t.integer :gender, null: false

      t.timestamps
    end
  end
end
