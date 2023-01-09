class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end
