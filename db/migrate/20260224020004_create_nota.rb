class CreateNota < ActiveRecord::Migration[8.1]
  def change
    create_table :nota do |t|
      t.text :contenido
      t.references :solicitante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
