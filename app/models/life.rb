class Life < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many :liked_users, through: :likes, source: :user
  has_many :likes
  has_many :yells

  def self.search(search)
    if search != ""
      Life.where('bad_thing LIKE? OR hope LIKE?' , "%#{search}%", "%#{search}%")
    else
      Life.all
    end
  end
  

  belongs_to :how_long
  belongs_to :month
  belongs_to :tired
  belongs_to :want
  with_options presence: true do
    validates :bad_thing
    validates :hope

    with_options numericality: { other_than: 1 } do
      validates :tired_id
      validates :how_long_id
      validates :want_id
      validates :month_id
    end
  end


end
