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

ActiveRecord::Schema.define(version: 2019_06_07_152534) do

  create_table "calenders", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.text "content"
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_calenders_on_user_id"
  end

  create_table "comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_comments_on_hash_id", unique: true
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "followings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "following_id"
    t.integer "follower_id"
    t.index ["follower_id", "following_id"], name: "index_followings_on_follower_id_and_following_id", unique: true
  end

  create_table "idols", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_idols_on_hash_id", unique: true
    t.index ["user_id"], name: "index_idols_on_user_id"
  end

  create_table "likes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "posts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.string "image_file"
    t.integer "user_id"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_posts_on_hash_id", unique: true
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "thread_comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "threader_id"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_thread_comments_on_hash_id", unique: true
    t.index ["threader_id"], name: "index_thread_comments_on_threader_id"
    t.index ["user_id"], name: "index_thread_comments_on_user_id"
  end

  create_table "threaders", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_threaders_on_hash_id", unique: true
    t.index ["user_id"], name: "index_threaders_on_user_id"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "profile"
    t.string "image_file"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.index ["hash_id"], name: "index_users_on_hash_id", unique: true
  end

  add_foreign_key "calenders", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "idols", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "thread_comments", "threaders"
  add_foreign_key "thread_comments", "users"
  add_foreign_key "threaders", "users"
end
