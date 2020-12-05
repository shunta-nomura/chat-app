class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  #validatesのunlessオプションにメソッド名を指定することで、「メソッドの返り値がfalseならばバリデーションによる検証を行う」という条件
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
