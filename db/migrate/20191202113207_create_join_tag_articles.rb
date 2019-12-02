class CreateJoinTagArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :join_tag_articles do |t|

      t.timestamps
    end
  end
end
