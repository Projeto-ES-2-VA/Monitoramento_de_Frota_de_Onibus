# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_21_040332) do
  create_table "motorista", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "email"
    t.string "senha"
    t.string "telefone"
    t.string "cnh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "onibuses", force: :cascade do |t|
    t.string "placa"
    t.string "chassi"
    t.string "modelo"
    t.integer "capacidade"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rota", force: :cascade do |t|
    t.string "nome"
    t.string "origem"
    t.string "destino"
    t.float "valor"
    t.float "distancia"
    t.float "duracao"
    t.time "inicio"
    t.time "fim"
    t.integer "onibus_id", null: false
    t.integer "motoristum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["motoristum_id"], name: "index_rota_on_motoristum_id"
    t.index ["onibus_id"], name: "index_rota_on_onibus_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "\"confirmation_token\"", name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "rota", "motorista"
  add_foreign_key "rota", "onibuses"
end
