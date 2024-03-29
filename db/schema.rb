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

ActiveRecord::Schema.define(version: 20161213143422) do

  create_table "agents", force: :cascade do |t|
    t.integer  "org_id"
    t.string   "roles"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_agents_on_confirmation_token", unique: true
    t.index ["email"], name: "index_agents_on_email", unique: true
    t.index ["org_id"], name: "index_agents_on_org_id"
    t.index ["reset_password_token"], name: "index_agents_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_agents_on_unlock_token", unique: true
  end

  create_table "app_configs", force: :cascade do |t|
    t.string   "group"
    t.string   "name"
    t.string   "val"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "attach_owner_type"
    t.integer  "attach_owner_id"
    t.string   "tag_name"
    t.string   "title"
    t.string   "attach_asset"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["attach_owner_type", "attach_owner_id"], name: "index_attachments_on_attach_owner_type_and_attach_owner_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string   "card_num"
    t.string   "holder_name"
    t.string   "person_id_num"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "channels", force: :cascade do |t|
    t.string   "channel_code"
    t.string   "channel_name"
    t.string   "success_code"
    t.string   "channel_out_code"
    t.string   "biz_out_code"
    t.string   "biz_type"
    t.integer  "t1_rate"
    t.integer  "d0_add_rate"
    t.integer  "d0_min_fee"
    t.string   "prepay_url"
    t.string   "query_url"
    t.string   "withdraw_url"
    t.string   "clr_url"
    t.string   "tmk"
    t.string   "public_cert"
    t.string   "channel_public_cert"
    t.string   "aes_key"
    t.integer  "status",              default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "http_logs", force: :cascade do |t|
    t.string   "sender_type"
    t.integer  "sender_id"
    t.string   "method"
    t.string   "sender"
    t.string   "receiver"
    t.text     "remote_detail"
    t.text     "send_data"
    t.text     "resp_body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["sender_type", "sender_id"], name: "index_http_logs_on_sender_type_and_sender_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.integer "org_id"
    t.string  "full_name"
    t.string  "short_name"
    t.string  "service_tel"
    t.string  "business_category"
    t.text    "memo"
    t.string  "lic_number"
    t.string  "jp_name"
    t.string  "jp_id_number"
    t.string  "contact_name"
    t.string  "contact_tel"
    t.string  "contact_email"
    t.string  "province"
    t.string  "urbn"
    t.string  "city_area"
    t.text    "address"
    t.string  "channel_code"
    t.string  "app_id"
    t.string  "merchant_type"
    t.index ["org_id"], name: "index_merchants_on_org_id"
  end

  create_table "notify_recvs", force: :cascade do |t|
    t.string   "method"
    t.string   "sender"
    t.string   "send_host"
    t.text     "params"
    t.text     "data"
    t.text     "result_message"
    t.integer  "status",         default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "ref"
  end

  create_table "orgs", force: :cascade do |t|
    t.string   "name"
    t.string   "org_code"
    t.string   "tmk"
    t.integer  "d0_rate"
    t.integer  "d0_min_fee"
    t.integer  "t1_rate"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pay_results", force: :cascade do |t|
    t.integer  "payment_id"
    t.string   "channel_name"
    t.string   "uni_order_num"
    t.string   "channel_order_num"
    t.string   "real_order_num"
    t.string   "send_code"
    t.string   "send_desc"
    t.datetime "send_time"
    t.string   "pay_code"
    t.string   "pay_desc"
    t.datetime "pay_time"
    t.string   "t0_code"
    t.string   "t0_desc"
    t.string   "pay_url"
    t.string   "qr_code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "open_id"
    t.string   "is_subscribe"
    t.string   "bank_type"
    t.integer  "total_fee"
    t.string   "transaction_id"
    t.string   "need_query"
    t.string   "app_id"
    t.string   "channel_client_id"
    t.integer  "notify_times"
    t.datetime "last_notify_at"
    t.string   "pay_state"
    t.index ["payment_id"], name: "index_pay_results_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "req_recv_id"
    t.string   "app_id"
    t.string   "open_id"
    t.integer  "org_id"
    t.string   "order_num"
    t.string   "order_day"
    t.string   "order_time"
    t.string   "order_expire_time"
    t.string   "goods_tag"
    t.string   "product_id"
    t.string   "order_title"
    t.string   "attach_info"
    t.integer  "amount"
    t.integer  "fee"
    t.string   "limit_pay"
    t.string   "remote_ip"
    t.string   "terminal_num"
    t.string   "method"
    t.string   "callback_url"
    t.string   "notify_url"
    t.integer  "card_id"
    t.integer  "status",            default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "auth_code"
    t.index ["card_id"], name: "index_payments_on_card_id"
    t.index ["order_day"], name: "index_payments_on_order_day"
    t.index ["order_num"], name: "index_payments_on_order_num"
    t.index ["org_id"], name: "index_payments_on_org_id"
    t.index ["req_recv_id"], name: "index_payments_on_req_recv_id"
  end

  create_table "pfb_merchts", force: :cascade do |t|
    t.integer  "merchant_id"
    t.integer  "org_id"
    t.string   "mch_id"
    t.string   "mch_key"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["merchant_id"], name: "index_pfb_merchts_on_merchant_id"
    t.index ["org_id"], name: "index_pfb_merchts_on_org_id"
  end

  create_table "req_recvs", force: :cascade do |t|
    t.string   "remote_ip"
    t.string   "method"
    t.string   "org_code"
    t.string   "sign"
    t.text     "data"
    t.text     "params"
    t.datetime "time_recv"
    t.text     "resp_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sent_posts", force: :cascade do |t|
    t.string   "sender_type"
    t.integer  "sender_id"
    t.string   "method"
    t.string   "post_url"
    t.text     "post_data"
    t.string   "resp_type"
    t.text     "resp_body"
    t.text     "result_message"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["sender_type", "sender_id"], name: "index_sent_posts_on_sender_type_and_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zx_clrs", force: :cascade do |t|
    t.string   "chnl_id"
    t.string   "pay_chnl_encd"
    t.string   "clr_dt"
    t.string   "trancode"
    t.string   "clr_dtl_fn"
    t.string   "dtl_memo"
    t.string   "rtncode"
    t.string   "rtninfo"
    t.integer  "status",        default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "zx_contr_info_lists", force: :cascade do |t|
    t.integer  "zx_mercht_id"
    t.string   "pay_typ_encd"
    t.string   "start_dt"
    t.decimal  "pay_typ_fee_rate", precision: 5, scale: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["zx_mercht_id"], name: "index_zx_contr_info_lists_on_zx_mercht_id"
  end

  create_table "zx_fields", force: :cascade do |t|
    t.string  "trancode"
    t.integer "msg_typ"
    t.string  "regn_en_nm"
    t.string  "regn_cn_nm"
    t.integer "sort_num"
    t.string  "regn_data_typ"
    t.integer "regn_nt_null"
    t.integer "is_sign_regn"
    t.integer "actv_stat"
    t.string  "table_name"
    t.string  "field_name"
  end

  create_table "zx_mcts", force: :cascade do |t|
    t.integer  "org_id"
    t.string   "chnl_id"
    t.string   "chnl_mercht_id"
    t.string   "pay_chnl_encd"
    t.string   "mercht_belg_chnl_id"
    t.string   "opr_cls"
    t.string   "acct_nm"
    t.string   "opn_bnk"
    t.string   "is_nt_citic"
    t.string   "acct_typ"
    t.string   "pay_ibank_num"
    t.string   "acct_num"
    t.string   "is_nt_two_line"
    t.string   "comm_fee_acct_type"
    t.string   "comm_fee_acct_nm"
    t.string   "comm_fee_bank_nm"
    t.string   "ibank_num"
    t.string   "comm_fee_acct_num"
    t.string   "trancode"
    t.string   "submt_dt"
    t.string   "chk_dt"
    t.string   "actv_dt"
    t.string   "actv_stat"
    t.string   "rtncode"
    t.string   "rtninfo"
    t.integer  "status",              default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["org_id"], name: "index_zx_mcts_on_org_id"
  end

  create_table "zx_merchts", force: :cascade do |t|
    t.string   "chnl_id"
    t.string   "chnl_mercht_id"
    t.string   "pay_chnl_encd"
    t.string   "mercht_belg_chnl_id"
    t.string   "mercht_full_name"
    t.string   "mercht_sht_nm"
    t.string   "cust_serv_tel"
    t.string   "contcr_nm"
    t.string   "contcr_tel"
    t.string   "contcr_mobl_num"
    t.string   "contcr_eml"
    t.string   "opr_cls"
    t.string   "mercht_memo"
    t.string   "prov"
    t.string   "urbn"
    t.text     "dtl_addr"
    t.string   "acct_nm"
    t.string   "opn_bnk"
    t.string   "is_nt_citic"
    t.string   "acct_typ"
    t.string   "pay_ibank_num"
    t.string   "acct_num"
    t.string   "is_nt_two_line"
    t.string   "comm_fee_acct_type"
    t.string   "comm_fee_acct_nm"
    t.string   "comm_fee_bank_nm"
    t.string   "ibank_num"
    t.string   "comm_fee_acct_num"
    t.string   "biz_lics_asset"
    t.string   "dtl_memo"
    t.string   "appl_typ"
    t.string   "trancode"
    t.text     "msg_sign"
    t.integer  "status",              default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
