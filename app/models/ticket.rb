class Ticket < ApplicationRecord

    max_paginates_per 10

    default_scope { order(created_at: :desc) }
    scope :find_by_cat, -> (code) { where(category_code: code, status: 0) }

    belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
    belongs_to :handler, class_name: 'User', foreign_key: 'handler_id', required: false
    belongs_to :category

    # validations
    validates_presence_of :title, message: 'هذا الحقل مطلوب.'
    validates_presence_of :category_code, message: 'هذا الحقل مطلوب.'

    # rich text
    has_rich_text :description
    validates_presence_of :description, message: 'هذا الحقل مطلوب.'

    

end
