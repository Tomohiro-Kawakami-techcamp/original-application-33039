class Delivery < ActiveHash::Base
    self.data = [
      {id: 0, name: '--'}, 
      {id: 1, name: 'スタジアム受け取り可'}, 
      {id: 2, name: '宅配（着払い）のみ可'},
    ]
      include ActiveHash::Associations
      has_many :items
end
