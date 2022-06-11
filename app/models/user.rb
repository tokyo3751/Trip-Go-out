class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #genderカラムに男性を選んだ時と女性を選んだ時に対応した、それぞれ番号を保存させる記述をする。
  enum gender: { man: 0, woman: 1}
  #ActiveStoreage を使って画像を持たせる
  has_one_attached :image
  #User モデルに Post モデルを関連付ける
  has_many :post, dependent: :destroy
end
