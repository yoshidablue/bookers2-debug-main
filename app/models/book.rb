class Book < ApplicationRecord

  belongs_to :user

  # dependent: :destroyは、１のモデルが消えた時にそれと付随してNのモデルも消す処理をするため。
  # 例）ユーザーが退会した時に、そのユーザーの投稿やいいねも一緒に消えるようにする処理
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body,  presence: true, length: {maximum: 200}

  def favorited_by?(user)
    # Favoriteモデルのuser_idカラムに引数で設定するuserのidが存在するかどうかを判別し、true,falseで返す。
    # .exists?は、存在の判別をするメソッド。
    favorites.where(user_id: user.id).exists?
  end

end