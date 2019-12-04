# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true

    	#informations pour le paiement 
      t.string :stripe_customer_id
      t.integer :amount
      t.string :currency
      t.string :description
    	
      t.timestamps
    end
  end
end
