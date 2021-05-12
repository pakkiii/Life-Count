class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :lives, dependent: :destroy

  has_many :yells

  has_many :likes, dependent: :destroy
  has_many :liked_lives, through: :likes, source: :life

  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy # 追記1
  has_many :followers, through: :passive_relationships, source: :use


  def follow(other_user)
    return if self == other_user

    relationships.find_or_create_by!(follower: other_user)
  end

  def following?(user)
    followings.include?(user)
  end

  def unfollow(relathinoship_id)
    relationships.find(relathinoship_id).destroy!
  end

  def already_liked?(life)
    self.likes.exists?(life_id: life.id)
  end

  with_options presence: true do
    validates :nick_name

  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
