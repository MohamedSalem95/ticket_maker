class Role < ApplicationRecord
    # relationships
    has_and_belongs_to_many :users

    default_scope { order(created_at: :desc) }

    # validations
    validates_presence_of :name, message: 'من فضلك ادخل الاسم.'
    validates_presence_of :code, message: 'من فضلك ادخل الكود.'
    
end
