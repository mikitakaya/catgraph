class PostImage < ApplicationRecord
  extend OrderAsSpecified
  # 投稿画像を「image」というカラムで保存
  has_one_attached :image
  # post_image（N）はuser（1）に属する
  belongs_to :user
  # post_imageが削除された際、post_comment・favoriteも削除される
  # post_image（1）はpost_comment（N）を複数持っている
  has_many :post_comments, dependent: :destroy
  # post_image（1）はfavorite（N）を複数持っている
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user, dependent: :destroy

  # image、title、bodyのデータは存在しなければならない
  validates :image, presence: true
  # titleは1〜50文字に制限する
  validates :title, presence: true, length: { in: 1..50 }
  # bodyは1〜140文字に制限する
  validates :body, presence: true, length: { in: 1..140 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(word)
   return PostImage.all unless word
   @post_image = PostImage.where("title LIKE? or body LIKE?", "%#{word}%", "%#{word}%")
  end

end
