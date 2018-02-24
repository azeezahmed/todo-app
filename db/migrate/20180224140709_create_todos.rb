class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.integer :status,default: 0

      t.timestamps
    end
  end
end
