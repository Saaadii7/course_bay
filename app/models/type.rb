class Type < ApplicationRecord
  # has_many :posts
  has_many :posts, foreign_key: "ptype", class_name: "Post"

end
