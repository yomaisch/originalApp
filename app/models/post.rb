class Post < ApplicationRecord
	validates :user_id, {presence: true}

	belongs_to :user

	def self.search(search)
      return Post.all unless search
      Post.where(['content LIKE ?', "%#{search}%"])
    end
end
