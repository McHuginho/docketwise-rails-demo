class CreateSolicitantes < ActiveRecord::Migration[8.1]
  def change
    create_table :solicitantes do |t|
      t.string :nombre
      t.boolean :aprobado
      t.string :email

      t.timestamps
    end
  end
end
