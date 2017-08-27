class Posts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :name
      t.text :content
    end
  end
end
