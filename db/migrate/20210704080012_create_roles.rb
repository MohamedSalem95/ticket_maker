class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.integer :code, null: false, unique: true
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
