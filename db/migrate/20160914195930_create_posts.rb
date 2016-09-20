class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |b|
      b.string :name
      b.string :content
    end
  end
end
