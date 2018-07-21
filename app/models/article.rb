class Article < ApplicationRecord
    validates :title,presence:true
    validates :body,presence:true
    
    scope :descending_order, -> { all.order("created_at DESC")}
end
