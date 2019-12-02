class CreateJoinTagEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :join_tag_events do |t|

      t.timestamps
    end
  end
end
