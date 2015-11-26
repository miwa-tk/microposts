class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.refernces :user, index: true, foreignkey: true
      t.text :content

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
