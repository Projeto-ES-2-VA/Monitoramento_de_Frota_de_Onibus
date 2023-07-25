class CreateParadas < ActiveRecord::Migration[7.0]
  def change
    create_table :paradas do |t|
      t.integer :numero
      t.string :nome
      t.string :rua
      t.string :bairro
      t.string :cep

      t.timestamps
    end
  end
end
