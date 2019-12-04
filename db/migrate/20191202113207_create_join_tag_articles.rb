# frozen_string_literal: true

class CreateJoinTagArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :join_tag_articles do |t|
      t.belongs_to :article, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
