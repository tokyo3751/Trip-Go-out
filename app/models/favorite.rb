class Favorite < ApplicationRecord
  #Favorite モデルに User,Post モデルを関連付ける
  belongs_to :user
  belongs_to :post
end
