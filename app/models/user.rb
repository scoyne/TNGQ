class User < ApplicationRecord
  has_many :wikis, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.email = email.downcase }
  before_save { self.role ||= :standard }

  enum role: [:standard, :premium, :admin]
  after_initialize :set_initial_role

  def set_initial_role
    self.role ||= :standard
  end
end
