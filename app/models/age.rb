class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '10 ~ 19代' },
    { id: 3, name: '20 ~ 29代' },
    { id: 4, name: '30 ~ 39代' },
    { id: 5, name: '40 ~ 49代' },
    { id: 6, name: '50 ~ 60代' }
  ]

  include ActiveHash::Associations
  
end