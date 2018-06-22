class User < ApplicationRecord
  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy
  has_many :wikis, through: :collaborators

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.email = email.downcase } # setting email to lowercase
  before_save { self.role ||= :standard } # setting user role or if none provided setting standard as default
  enum role: [:standard, :premium, :admin] # setting numeric valuse to user rules 0 = standard, 1 = premium, 2 = admin
  
  after_initialize :set_initial_role # setting inital role to standard unless set
  
  def set_initial_role
    self.role ||= :standard # defining the initial / default role 
  end
  
  def collaborator_for(wiki)
    collaborators.where(wiki_id: wiki.id).first
  end
  
  protected
  def confirmation_required?
    false
  end
end