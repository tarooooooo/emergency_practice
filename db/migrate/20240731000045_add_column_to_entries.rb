class AddColumnToEntries < ActiveRecord::Migration[6.1]
  def change
    add_reference :entries, :pet, foreign_key: true, after: :id
    add_reference :entries, :contest, foreign_key: true, after: :pet_id
    add_index :entries, [:pet_id, :contest_id], unique: true
  end
end
