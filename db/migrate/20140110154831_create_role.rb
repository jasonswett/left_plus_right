class CreateRole < ActiveRecord::Migration
  def change
    create_table :role do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end

    add_index :role, :name, unique: true
  end
end
