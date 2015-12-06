class Micropost < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    validates :content, presence: true, length: { maximum: 140 }
    
# kaminari設定
    paginates_per 7

end
