class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment_text
 
      t.timestamps
    end
 
    add_index(:comments, :id, unique: true)
    add_reference(:comments, :post, foreign_key: true)
    add_reference(:comments, :user, foreign_key: true)
  end
 end
