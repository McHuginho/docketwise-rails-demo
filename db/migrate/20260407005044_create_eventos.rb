class CreateEventos < ActiveRecord::Migration[8.1]
  def change
    create_table :eventos do |t|
      t.string :titulo
      t.text :descripcion
      t.date :fecha
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
