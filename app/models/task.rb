class Task < ApplicationRecord
    validates :name, :content, presence: true
    scope  :order_by_created_at, ->  {order(created_at: :desc)}
    scope  :order_by_deadline,  ->  {order(expiry_date: :desc)}
    scope  :order_by_priority_button,  ->  {order(priority: :desc)}
    scope  :order_by_priority,  ->  (priority){where(priority: priority)}
    scope  :order_by_status,  ->  (status){where(status: status)}
    scope  :title_search, -> (search_key){where("name LIKE ?","%#{search_key}%")}
    scope :kaminari, -> (kaminari_pages){page(kaminari_pages).per(5)}
    paginates_per 50
    enum status: {
        unstarted: 0,
        progress: 1,
        completed: 2
    }
    enum priority: {
        Low: 0,
        Medium:1,
        High: 2
    }
end
