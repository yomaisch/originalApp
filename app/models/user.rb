# frozen_string_literal: true

class User < ApplicationRecord
  validates :last_name, { presence: true }
  validates :first_name, { presence: true }
  validates :last_name_kana, { presence: true, format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: '全角カタカナのみで入力して下さい'
  } }
  validates :first_name_kana, { presence: true, format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: '全角カタカナのみで入力して下さい'
  } }
  validates :email, { presence: true }
  validates :password, { presence: true }

  has_many :posts, dependent: :destroy

  def posts
    Post.where(user_id: id)
  end
end
