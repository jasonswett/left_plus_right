class CreateUser < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :occupation, null: false, default: ""
      t.references :role, index: true, null: false

      t.timestamps
    end

    add_index :user, [:first_name, :last_name, :occupation], unique: true
    add_foreign_key :user, :role
  end
end
