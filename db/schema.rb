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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140205134356) do

  create_table "agreements", :force => true do |t|
    t.string   "agreement_no"
    t.string   "agreement_status"
    t.string   "item"
    t.string   "case_cost"
    t.string   "pricing_option"
    t.string   "fob_point"
    t.string   "commitment_string"
    t.string   "min_com"
    t.string   "min_per_order"
    t.string   "unit_cost"
    t.string   "mktg_all"
    t.string   "cross_dock_all"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "case_cost_w"
    t.string   "agreement_customer_dept"
    t.string   "department"
    t.string   "agreementdate"
    t.string   "agreement_customer"
    t.string   "agreement_vendor"
    t.string   "agreementno"
    t.string   "total_qty"
    t.integer  "purchasedqty"
  end

  create_table "brokers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "brokers", ["email"], :name => "index_brokers_on_email", :unique => true
  add_index "brokers", ["reset_password_token"], :name => "index_brokers_on_reset_password_token", :unique => true

  create_table "customers", :force => true do |t|
    t.string   "customer_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "fax"
    t.string   "phone"
    t.string   "deptt"
    t.string   "buyer"
    t.string   "ics"
    t.string   "asst_buyer"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "customer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "ics"
    t.string   "asst_buyer"
    t.string   "department"
    t.string   "buyer"
  end

  create_table "items", :force => true do |t|
    t.string   "item_name"
    t.string   "item_shipping_point"
    t.string   "upc_code"
    t.string   "pre_upc_code"
    t.string   "item_desc"
    t.string   "origin_country"
    t.string   "shelf_life_from_dom"
    t.string   "shelf_life_guaranteed_dom"
    t.string   "spoil_all"
    t.string   "sell_unit_dim"
    t.string   "sell_unit_net_weight"
    t.string   "sell_unit_qty_mstr_pk"
    t.string   "master_pk_dim"
    t.string   "master_pack_cube"
    t.string   "master_pk_net_weight"
    t.string   "master_pack_gross_weight"
    t.string   "master_pack_qty_pallet"
    t.string   "pallet_config"
    t.string   "pallet_dim"
    t.string   "pallet"
    t.string   "pallet_weight"
    t.string   "pallet_xchng"
    t.string   "truckload_qty"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "vendor_id"
    t.string   "unit_price_w"
    t.string   "item_no"
    t.string   "unit_price_e"
    t.integer  "qty_string"
  end

  create_table "pos", :force => true do |t|
    t.string   "po_numb"
    t.string   "bill_to_name"
    t.string   "bill_to_id"
    t.string   "bill_to_add"
    t.string   "bill_to_phone"
    t.string   "vendor_name"
    t.string   "vendor_phone"
    t.string   "vendor_add"
    t.string   "agreement_id"
    t.string   "qty_string"
    t.string   "desc"
    t.string   "item_id"
    t.string   "item_desc"
    t.string   "item_cost"
    t.string   "item_name"
    t.string   "item_shipping_point"
    t.string   "po_status"
    t.string   "po_total_amount"
    t.string   "po_date"
    t.string   "po_date_reqstd"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "pono"
  end

  create_table "states", :force => true do |t|
    t.string   "stcode"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vendors", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "vendor_name"
    t.string   "corp_add"
    t.string   "corp_city"
    t.string   "corp_state"
    t.string   "corp_zip"
    t.string   "corp_fax"
    t.string   "corp_phone"
    t.string   "corp_email"
    t.string   "remit_add"
    t.string   "remit_city"
    t.string   "remit_state"
    t.string   "remit_zip"
    t.string   "cont_person"
    t.string   "sales_cont_person"
    t.string   "sales_cont_phone"
    t.string   "sales_cont_mob"
    t.string   "web_url"
    t.string   "payment_terms"
    t.string   "extd_terms"
    t.string   "grand_op_terms"
    t.string   "cross_dock_all"
    t.string   "freight_all"
    t.string   "grand_op_all"
    t.string   "cust_ser_cont"
    t.string   "cust_ser_ph"
    t.string   "cust_ser_fax"
    t.string   "edi"
  end

end
