class CreateOnibuses < ActiveRecord::Migration[7.0]
  def change
    create_table :onibuses do |t|
      t.string :placa
      t.string :chassi
      t.string :modelo
      t.integer :capacidade
      t.string :status

      t.timestamps
    end
  end
end
