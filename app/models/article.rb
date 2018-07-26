class Article < ApplicationRecord
    validates :title,presence:true
    validates :body,presence:true
    belongs_to :user
    scope :descending_order, -> { all.order("created_at DESC")}
    
    has_many :comments,dependent: :destroy
end
