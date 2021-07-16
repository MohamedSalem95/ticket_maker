class Department < ApplicationRecord

    default_scope { order(created_at: :desc) }

    validates_presence_of :name, message: 'من فضلك ادخل الاسم.'
    validates_presence_of :code, message: '.من فضلك ادخل الكود'

end
