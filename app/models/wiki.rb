class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  
  
  def public?
    self.private != true
  end
end
