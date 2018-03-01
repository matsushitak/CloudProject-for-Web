class Project < ApplicationRecord

  # 投稿ユーザー
  belongs_to :user

  # タイトル
  validates :title, presence: true, length: {maximum: 50}

  # 画像名
  validates :image_name, presence: true

  # 概要
  validates :overview, presence: true, length: {maximum: 300}

  # カテゴリ
  validates :category, presence: true
  enum category: {
      business: "ビジネス・起業",
      charenge: "チャレンジ",
      entertainment: "エンターテイメント",
      event: "イベント",
      food: "フード",
      local: "地域",
      sports: "スポーツ",
      technology: "テクノロジー"
  }

  # 募集開始日
  validates :recruitment_date_start, presence: true

  # 募集終了日
  validates :recruitment_date_finish, presence: true

  # 募集人数
  validates :people_count_goal, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # テキスト
  validates :text, presence: true

end
