class CreateMotorista < ActiveRecord::Migration[7.0]
  def change
    create_table :motorista do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.string :senha
      t.string :telefone
      t.string :cnh

      t.timestamps
    end
  end
end
