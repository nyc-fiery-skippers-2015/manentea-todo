class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
