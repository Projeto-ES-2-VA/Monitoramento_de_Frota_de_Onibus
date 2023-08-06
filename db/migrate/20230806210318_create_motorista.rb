class CreateMotorista < ActiveRecord::Migration[7.0]
  def change
    create_table :motorista do |t|
      t.string :cnh

      t.timestamps
    end
  end
end
