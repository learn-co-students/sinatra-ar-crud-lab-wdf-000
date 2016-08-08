class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |col|
      col.string :name
      col.text :content
    end
  end
end
