class FirstCreate < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string  :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end

    create_table :comments do |t|
      t.text :content
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end

    create_table :categories do |t|
      t.string :title

      t.timestamps
    end

    create_table :connentions do |t|
      t.integer :post_id
      t.integer :category_id

      t.timestamps
    end

    create_table :users do |t|
      t.string :account
      t.string :password_digest
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
