class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
    end

    add_index(:posts, :id, unique: true)
    add_reference(:posts, :user, foreign_key: true)
  end
end
