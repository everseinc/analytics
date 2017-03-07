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

ActiveRecord::Schema.define(version: 20170307165624) do

  create_table "apps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "app_name",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apps_customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "app_id",       null: false
    t.integer  "customer_id",  null: false
    t.integer  "authority_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["app_id"], name: "app_id", using: :btree
    t.index ["customer_id", "app_id"], name: "index_apps_customers_on_customer_id_and_app_id", unique: true, using: :btree
  end

  create_table "apps_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id", null: false
    t.integer  "app_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "app_id", using: :btree
    t.index ["project_id", "app_id"], name: "index_apps_projects_on_project_id_and_app_id", unique: true, using: :btree
  end

  create_table "authorities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name",       null: false
    t.index ["email"], name: "index_customers_on_email", using: :btree
  end

  create_table "customers_passwords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "customer_id", null: false
    t.integer  "password_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "customer_id", using: :btree
    t.index ["password_id"], name: "password_id", using: :btree
  end

  create_table "customers_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "customer_id",        null: false
    t.integer  "project_id",         null: false
    t.string   "customer_authority", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["customer_id", "project_id"], name: "index_customers_projects_on_customer_id_and_project_id", unique: true, using: :btree
    t.index ["project_id"], name: "project_id", using: :btree
  end

  create_table "dim_stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id", null: false
    t.string   "key",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dimensions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id",   null: false
    t.string   "name",         null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "dim_store_id", null: false
  end

  create_table "emo_blocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id",   null: false
    t.integer  "dimension_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["project_id"], name: "project_id", using: :btree
  end

  create_table "emo_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "emo_block_id", null: false
    t.integer  "emotion_id",   null: false
    t.integer  "value",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["emo_block_id"], name: "emo_block_id", using: :btree
  end

  create_table "emo_tios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emo_tips", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emotions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",      null: false
    t.string   "uuid",       null: false
    t.datetime "limited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "app_id",     null: false
  end

  create_table "passwords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "project_name", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "apps_customers", "apps", name: "apps_customers_ibfk_2", on_delete: :cascade
  add_foreign_key "apps_customers", "customers", name: "apps_customers_ibfk_1", on_delete: :cascade
  add_foreign_key "apps_projects", "apps", name: "apps_projects_ibfk_1", on_delete: :cascade
  add_foreign_key "apps_projects", "projects", name: "apps_projects_ibfk_2", on_delete: :cascade
  add_foreign_key "customers_passwords", "customers", name: "customers_passwords_ibfk_1", on_delete: :cascade
  add_foreign_key "customers_passwords", "passwords", name: "customers_passwords_ibfk_2", on_delete: :cascade
  add_foreign_key "customers_projects", "customers", name: "customers_projects_ibfk_1", on_delete: :cascade
  add_foreign_key "customers_projects", "projects", name: "customers_projects_ibfk_2", on_delete: :cascade
  add_foreign_key "emo_blocks", "projects", name: "emo_blocks_ibfk_1", on_delete: :cascade
  add_foreign_key "emo_records", "emo_blocks", name: "emo_records_ibfk_1", on_delete: :cascade
end
