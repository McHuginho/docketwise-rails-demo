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

ActiveRecord::Schema[8.1].define(version: 2026_02_24_020004) do
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
  end

  add_foreign_key "nota", "solicitantes"
end
