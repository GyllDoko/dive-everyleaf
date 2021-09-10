class Task < ApplicationRecord
    validates :name, :content, presence: true
    scope  :order_by_created_at, ->  {order(created_at: :desc)}
    scope  :order_by_deadline,  ->  {order(expiry_date: :desc)}
end
