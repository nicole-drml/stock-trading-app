class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :balance, numericality: { greater_than_or_equal_to: 0.0, message: "insufficient"}
  validates :first_name, presence: true
  validates :last_name, presence: true 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :confirmable

  enum status: [:pending, :approved, :denied]
  after_initialize :set_default_status, :if => :new_record?
  
  def set_default_status
    self.status ||= :approved
  end

  enum role: [:trader, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :trader
  end

  def admin?
    role == 'admin'
   end
end

