class CreateRota < ActiveRecord::Migration[7.0]
  def change
    create_table :rota do |t|
      t.string :nome
      t.float :valor
      t.float :distancia
      t.float :duracao
      t.string :inicio
      t.string :fim
      t.time :horario

      t.timestamps
    end
  end
end
