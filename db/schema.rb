# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180127152834) do

  create_table "attempts", force: :cascade do |t|
    t.text "code"
    t.boolean "final"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_attempts_on_task_id"
  end

  create_table "results", force: :cascade do |t|
    t.string "expected"
    t.string "output"
    t.boolean "done"
    t.integer "attempt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attempt_id"], name: "index_results_on_attempt_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.integer "task_id"
    t.string "input"
    t.string "output"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_solutions_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "template"
  end

end
