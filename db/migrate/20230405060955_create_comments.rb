class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment_body, null: false
      t.integer :customer_id, null: false
      t.integer :article_id, null: false

      t.timestamps
    end
  end
end
