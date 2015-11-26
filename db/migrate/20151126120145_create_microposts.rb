class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.reference :user
      t.text :content

      t.timestamps null: false
    end
  end
end
