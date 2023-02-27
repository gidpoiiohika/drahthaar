class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :description
      t.string :father
      t.string :mother
      t.string :stigma

      t.timestamps
    end
  end
end
