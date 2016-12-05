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

ActiveRecord::Schema.define(version: 20161205130013) do

  create_table "apps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "app_name",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apps_customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "app_id",             null: false
    t.integer  "customer_id",        null: false
    t.string   "customer_authority", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["app_id"], name: "index_apps_customers_on_app_id", using: :btree
    t.index ["customer_id", "app_id"], name: "index_apps_customers_on_customer_id_and_app_id", unique: true, using: :btree
    t.index ["customer_id"], name: "index_apps_customers_on_customer_id", using: :btree
  end

  create_table "apps_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id", null: false
    t.integer  "app_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_apps_projects_on_app_id", using: :btree
    t.index ["project_id", "app_id"], name: "index_apps_projects_on_project_id_and_app_id", unique: true, using: :btree
    t.index ["project_id"], name: "index_apps_projects_on_project_id", using: :btree
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", using: :btree
  end

  create_table "customers_passwords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "customer_id", null: false
    t.integer  "password_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_customers_passwords_on_customer_id", using: :btree
    t.index ["password_id"], name: "index_customers_passwords_on_password_id", using: :btree
  end

  create_table "customers_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "customer_id",        null: false
    t.integer  "project_id",         null: false
    t.string   "customer_authority", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["customer_id", "project_id"], name: "index_customers_projects_on_customer_id_and_project_id", unique: true, using: :btree
    t.index ["customer_id"], name: "index_customers_projects_on_customer_id", using: :btree
    t.index ["project_id"], name: "index_customers_projects_on_project_id", using: :btree
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

end

