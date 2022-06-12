class Reply < ApplicationRecord
  #Reply モデルに User モデルと Post モデルを関連付ける
  belongs_to :user
  belongs_to :post
end
