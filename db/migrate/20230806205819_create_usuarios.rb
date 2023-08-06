class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.string :senha
      t.string :telefone

      t.timestamps
    end
  end
end
