class CreateRota < ActiveRecord::Migration[7.0]
  def change
    create_table :rota do |t|
      t.string :nome, :origem, :destino
      t.float :valor, :distancia, :duracao
      t.time :inicio, :fim
      t.references :onibus, :motoristum, null: false, foreign_key: true
      t.timestamps
    end
  end
end
