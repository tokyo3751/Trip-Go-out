class Post < ApplicationRecord
  #ActiveStoreage を使って画像を持たせる
  has_one_attached :image
  #Post モデルに User モデルを関連付ける
  belongs_to :user
  #Post モデルに Reply モデルを関連付ける
  has_many :reply, dependent: :destroy
  #画像を表示させるメソッド
  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
