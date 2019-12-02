class CreateArticles < ActiveRecord::Migration[5.2]
  def change
  	create_table :articles do |t|

  	 	t.text :title
  	 	t.text :content

  	 	t.belongs_to :user, index: true

  	 	t.belongs_to :author


      t.timestamps
    end
  end
end
