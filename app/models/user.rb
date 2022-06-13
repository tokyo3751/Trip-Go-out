class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #genderカラムに男性を選んだ時と女性を選んだ時に対応した、それぞれ番号を保存させる記述をする。
  enum gender: { man: 0, woman: 1}
  #ActiveStoreage を使って画像を持たせる
  has_one_attached :profile_image
  #User モデルに Post モデルを関連付ける
  has_many :post, dependent: :destroy
  #User モデルに Reply モデルを関連付ける
  has_many :replys, dependent: :destroy
  #User モデルに Favorite モデルを関連付ける
  has_many :favorites, dependent: :destroy

  #ActiveStorageを使い画像をアップロードできるようにするメソッド
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end