class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #kaminari
  max_paginates_per 10

  # has one image
  has_one_attached :avatar

  # validations
  validates_presence_of :department_code, message: 'من فضلك اختر الاداره.'
  validates_presence_of :first_name, message: 'هذا الحقل مطلوب.'
  validates_presence_of :last_name, message: 'هذا الحقل مطلوب.'
  validates_presence_of :const_no, message: 'من فضلك ادخل الرقم الثابت.'
  validates_presence_of :job, message: 'هذا الحقل مطلوب.'
  validates_presence_of :phone_no, message: 'من فضلك ادخل رقم الهاتف المحمول.'


  # relationships
  has_and_belongs_to_many :roles
  has_many :owned_tickets, class_name: 'Ticket', foreign_key: 'owner_id'
  has_many :handling_tickets, class_name: 'Ticket', foreign_key: 'handler_id'

  ## virtual attr
  # attribute :role_code, :integer, default: self.roles[0].code

  # call backs
  after_create :set_normal_user

  scope :latest, -> { order(created_at: :desc) }

  def set_normal_user
    # set the user as a normal user
    role = Role.find_by_code(1)
    self.roles << role
  end

  def get_dep
    Department.find_by_code(self.department_code).name
  end

  def add_role(code)
    role = Role.find_by_code(code)
    self.roles.clear
    self.save
    self.roles << role
  end

  def has_role?(code)
    role = Role.find_by_code(code)
    if self.roles.include?(role)
      true
    else
      false
    end
  end
  

end
