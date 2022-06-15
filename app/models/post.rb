class Post < ApplicationRecord
  #ActiveStoreage を使って画像を持たせる
  has_one_attached :image
  #Post モデルに User モデルを関連付ける
  belongs_to :user
  #Post モデルに Reply モデルを関連付ける
  has_many :reply, dependent: :destroy
  #Post モデルに Favorite モデルを関連付ける
  has_many :favorites, dependent: :destroy
  #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べるメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  #画像を表示させるメソッド
  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
end
