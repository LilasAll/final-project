class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.integer :duration
      t.string :title
      t.text :description
      t.string :location

      t.belongs_to :admin

      # t.belongs_to :user, index: true
      # t.references :admin, index: true

      t.timestamps
    end
  end
end
