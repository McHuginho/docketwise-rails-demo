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

ActiveRecord::Schema[8.1].define(version: 2026_04_07_005044) do
  create_table "eventos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "descripcion"
    t.date "fecha"
    t.string "titulo"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_eventos_on_user_id"
  end

  create_table "nota", force: :cascade do |t|
    t.text "contenido"
    t.datetime "created_at", null: false
    t.integer "solicitante_id", null: false
    t.datetime "updated_at", null: false
    t.index ["solicitante_id"], name: "index_nota_on_solicitante_id"
  end

  create_table "solicitantes", force: :cascade do |t|
    t.boolean "aprobado"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "nombre"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_solicitantes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "eventos", "users"
  add_foreign_key "nota", "solicitantes"
  add_foreign_key "solicitantes", "users"
end
