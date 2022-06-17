class Evaluation < ApplicationRecord
  # Evaluations モデルに User,Postモデルを関連付ける
  belongs_to :user
  belongs_to :post
end
