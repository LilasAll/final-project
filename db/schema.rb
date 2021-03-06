# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_191_209_201_459) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'articles', force: :cascade do |t|
    t.text 'title'
    t.text 'content'
    t.string 'resume'
    t.boolean 'is_validated', default: false
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_articles_on_author_id'
  end

  create_table 'attendances', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'event_id'
    t.string 'stripe_customer_id'
    t.integer 'amount'
    t.string 'currency'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_attendances_on_event_id'
    t.index ['user_id'], name: 'index_attendances_on_user_id'
  end

  create_table 'bugs', force: :cascade do |t|
    t.string 'user_name'
    t.string 'content'
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_bugs_on_user_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'content'
    t.bigint 'user_id'
    t.bigint 'event_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_comments_on_event_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'conversations', force: :cascade do |t|
    t.integer 'sender_id'
    t.integer 'recipient_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'events', force: :cascade do |t|
    t.datetime 'start_date'
    t.datetime 'start_time'
    t.integer 'duration'
    t.string 'title'
    t.text 'description'
    t.string 'location'
    t.boolean 'is_validated', default: false
    t.integer 'price', default: 0
    t.decimal 'latitude', precision: 15, scale: 13
    t.decimal 'longitude', precision: 15, scale: 13
    t.bigint 'creator_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['creator_id'], name: 'index_events_on_creator_id'
  end

  create_table 'join_tag_articles', force: :cascade do |t|
    t.bigint 'article_id'
    t.bigint 'tag_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['article_id'], name: 'index_join_tag_articles_on_article_id'
    t.index ['tag_id'], name: 'index_join_tag_articles_on_tag_id'
  end

  create_table 'join_tag_events', force: :cascade do |t|
    t.bigint 'event_id'
    t.bigint 'tag_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_join_tag_events_on_event_id'
    t.index ['tag_id'], name: 'index_join_tag_events_on_tag_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'article_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['article_id'], name: 'index_likes_on_article_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.text 'body'
    t.bigint 'conversation_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['conversation_id'], name: 'index_messages_on_conversation_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'places', force: :cascade do |t|
    t.string 'name'
    t.decimal 'latitude', precision: 15, scale: 13
    t.decimal 'longitude', precision: 15, scale: 13
    t.boolean 'associations', default: false
    t.boolean 'meeting', default: false
    t.boolean 'recycling', default: false
    t.boolean 'garden', default: false
    t.boolean 'shared_garden', default: false
    t.boolean 'zero_waste', default: false
    t.boolean 'secondhand', default: false
    t.boolean 'cultural', default: false
    t.boolean 'feminist', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'read_marks', id: :serial, force: :cascade do |t|
    t.string 'readable_type', null: false
    t.integer 'readable_id'
    t.string 'reader_type', null: false
    t.integer 'reader_id'
    t.datetime 'timestamp'
    t.index %w[readable_type readable_id], name: 'index_read_marks_on_readable_type_and_readable_id'
    t.index %w[reader_id reader_type readable_type readable_id], name: 'read_marks_reader_readable_index', unique: true
    t.index %w[reader_type reader_id], name: 'index_read_marks_on_reader_type_and_reader_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'address'
    t.string 'pseudo'
    t.string 'first_name'
    t.string 'last_name'
    t.boolean 'is_admin', default: false
    t.boolean 'is_asso', default: false
    t.string 'description'
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
end
