# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.integer :duration
      t.string :title
      t.text :description
      t.string :location
      t.boolean :is_validated, default: false
      t.integer :price, default: '0'

      t.belongs_to :creator

      # t.belongs_to :user, index: true
      # t.references :admin, index: true

      t.timestamps
    end
  end
end
