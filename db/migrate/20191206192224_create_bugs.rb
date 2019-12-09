# frozen_string_literal: true

class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :user_name
      t.string :content

      t.belongs_to :user
    end
  end
end
