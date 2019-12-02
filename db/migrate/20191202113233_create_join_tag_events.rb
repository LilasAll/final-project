class CreateJoinTagEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :join_tag_events do |t|

    	t.belongs_to :event,  index: true
    	t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
