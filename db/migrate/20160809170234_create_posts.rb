class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
    end
  end

  def down
    drop_table :blogs
  end
end
