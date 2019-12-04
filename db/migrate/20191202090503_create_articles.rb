class CreateArticles < ActiveRecord::Migration[5.2]
  def change
  	create_table :articles do |t|

  	 	t.text :title
  	 	t.text :content
  	 	t.boolean :is_validated, :default => false

  	 	t.belongs_to :author

      t.timestamps
    end
  end
end
