# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150608230803) do

  create_table "kellogg_budget_tables", force: :cascade do |t|
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "kelloggstartyear"
    t.integer  "kelloggtuition"
    t.integer  "kelloggbooks"
    t.integer  "kelloggtravelexpenses"
    t.integer  "kellogghealthinsurance"
    t.integer  "kelloggcomputer"
    t.integer  "kelloggstudentlifefee"
    t.integer  "kelloggenrollmentfee"
    t.integer  "kelloggloanfees"
    t.string   "username"
    t.string   "useremail"
    t.integer  "kelloggbudgetyear"
    t.integer  "kelloggroomboard"
    t.integer  "kelloggpersonalexpenses"
    t.integer  "kelloggcostyr1"
    t.integer  "kelloggcostyr2"
    t.integer  "tuitionyr2"
    t.integer  "maxloanyr1"
    t.integer  "maxloanyr2"
    t.float    "loaninterestrate"
    t.integer  "bonusrate"
    t.integer  "rentmortgage"
    t.integer  "utilities"
    t.integer  "cableinternet"
    t.integer  "gas"
    t.integer  "generalspending"
    t.integer  "retirementsavings"
    t.integer  "monthlyloanpayment"
    t.integer  "monthlyposttaxsalary"
    t.integer  "monthlyposttaxbonus"
    t.integer  "monthlysavings"
    t.integer  "tuitionyr1"
    t.integer  "scholarships"
    t.integer  "personalcontribution"
    t.integer  "totalloanamount"
    t.integer  "loanpayoffperiod"
    t.integer  "pretaxsalary"
    t.integer  "carinsurance"
    t.integer  "carpayment"
    t.integer  "parking"
    t.integer  "cellphone"
    t.integer  "food"
    t.integer  "publictransit"
    t.integer  "entertainment"
    t.float    "personalsavingsrate"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "kellogg_budget_tables", ["email"], name: "index_kellogg_budget_tables_on_email", unique: true
  add_index "kellogg_budget_tables", ["reset_password_token"], name: "index_kellogg_budget_tables_on_reset_password_token", unique: true

end
