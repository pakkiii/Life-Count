class Yell < ApplicationRecord
  belongs_to :life
  belongs_to :user
  with_options presence: true do
    validates :content
  end
end
