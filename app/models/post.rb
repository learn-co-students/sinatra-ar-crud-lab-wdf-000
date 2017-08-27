class Post < ActiveRecord::Base

  def self.create_post(details)
    @post = Post.create do |field|
      field.name = details[:name]
      field.content = details[:content]
    end
    @post.save
  end

  def update(details)
    self.name = details[:name]
    self.content = details[:content]
    self
  end

end