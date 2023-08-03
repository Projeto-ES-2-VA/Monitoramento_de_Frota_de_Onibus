class CreateRota < ActiveRecord::Migration[7.0]
  def change
    create_table :rota do |t|
      t.string :nome
      t.float :valor
      t.float :distancia
      t.float :duracao
      t.time :inicio
      t.time :fim
      t.string :origem
      t.string :destino
      t.references :onibus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
