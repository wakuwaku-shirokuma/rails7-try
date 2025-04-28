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

ActiveRecord::Schema[7.0].define(version: 2025_04_28_081801) do
  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "salesforce_id"
    t.index ["salesforce_id"], name: "index_companies_on_salesforce_id", unique: true
  end

  create_table "document_screening_histories", force: :cascade do |t|
    t.integer "document_screening_id", null: false
    t.integer "user_id", null: false
    t.integer "profile_id", null: false
    t.string "result"
    t.text "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_screening_id"], name: "index_document_screening_histories_on_document_screening_id"
    t.index ["profile_id"], name: "index_document_screening_histories_on_profile_id"
    t.index ["user_id"], name: "index_document_screening_histories_on_user_id"
  end

  create_table "document_screening_phases", force: :cascade do |t|
    t.string "phaseable_type", null: false
    t.integer "phaseable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phaseable_type", "phaseable_id"], name: "index_document_screening_phases_on_phaseable"
  end

  create_table "document_screenings", force: :cascade do |t|
    t.integer "document_screening_phase_id", null: false
    t.integer "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_screening_phase_id"], name: "index_document_screenings_on_document_screening_phase_id"
    t.index ["profile_id"], name: "index_document_screenings_on_profile_id"
  end

  create_table "interview_phases", force: :cascade do |t|
    t.datetime "interview_date"
    t.string "interviewer"
    t.integer "evaluation_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offer_phases", force: :cascade do |t|
    t.datetime "offer_date"
    t.integer "offer_amount"
    t.datetime "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_offices_on_company_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "profile_id", null: false
    t.integer "work_type"
    t.integer "working_hours"
    t.integer "min_salary"
    t.integer "max_salary"
    t.string "tech_stack"
    t.date "start_date"
    t.text "skillset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_preferences_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "status"
    t.integer "office_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "email"
    t.string "phone_number"
    t.date "birthdate"
    t.string "address"
    t.index ["office_id"], name: "index_profiles_on_office_id"
  end

  create_table "selections", force: :cascade do |t|
    t.integer "profile_id", null: false
    t.string "phase_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_selections_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "document_screening_histories", "document_screenings"
  add_foreign_key "document_screening_histories", "profiles"
  add_foreign_key "document_screening_histories", "users"
  add_foreign_key "document_screenings", "document_screening_phases"
  add_foreign_key "document_screenings", "profiles"
  add_foreign_key "offices", "companies"
  add_foreign_key "preferences", "profiles"
  add_foreign_key "profiles", "offices"
  add_foreign_key "selections", "profiles"
end
