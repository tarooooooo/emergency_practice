class CreateBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :breeds do |t|
      t.references :animal, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
      t.index [:animal_id, :name], unique: true
    end
  end
end
