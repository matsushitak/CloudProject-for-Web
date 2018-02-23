class User < ApplicationRecord
  has_secure_password

  # ユーザー名
  validates :name, presence: true, length: {maximum: 16}

  # メールアドレス
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
end
