class Tired < ActiveHash::Base
  self.data = [
    { id: 1, name: '現状のしんどいカテゴリーは何ですか？' },
    { id: 2, name: '家族関係' },
    { id: 3, name: '仕事' },
    { id: 4, name: '学校' },
    { id: 5, name: 'プライベート' },
    { id: 6, name: 'それ以外' },
    { id: 7, name: '自分でもよく分からない' }
  ]

  include ActiveHash::Associations
  has_many :lives
end

