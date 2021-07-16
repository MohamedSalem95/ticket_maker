class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title, null: false, limit: 100
      t.integer :status, default: 0
      t.text :public_notes, null: true
      t.text :private_notes, null: true

      # users
      #owner
      t.belongs_to :owner

      # the technical support working on the ticket
      t.belongs_to :handler, null: true

      # category
      t.integer :category_code

      t.belongs_to :category
      t.timestamps
    end
  end
end