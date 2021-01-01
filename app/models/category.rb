class Category < ActiveHash::Base
  self.data = [
    {id: 0, name: '--'}, 
    {id: 1, name: 'ユニフォーム'}, 
    {id: 2, name: 'トレーニングウェア'}, 
    {id: 3, name: 'プレーヤーグッズ'}, 
    {id: 4, name: 'タオル'}, 
    {id: 5, name: '応援グッズ'}, 
    {id: 6, name: 'アパレル'}, 
    {id: 7, name: 'ステーショナリー'}, 
    {id: 8, name: 'バッグ'}, 
    {id: 9, name: 'その他'}, 
]

  include ActiveHash::Associations
  has_many :items
end