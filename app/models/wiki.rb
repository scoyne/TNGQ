class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :collaboration_users, through: :collaborators, source: :user  
  
  def public?
    self.private != true
  end
end
