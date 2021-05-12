class Month < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '年明け' },
    { id: 3, name: '春先' },
    { id: 4, name: '秋' },
    { id: 5, name: 'クリスマス' },
    { id: 6, name: 'それ以外' }
  ]

  include ActiveHash::Associations
  has_many :lives
end