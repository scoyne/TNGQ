class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :user, through: :collaborators

  default_scope { order('created_at DESC') }

  scope :visible_to, -> (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? all : where("private = ? OR private IS NULL",  false)}
  
 # def collaborator_for(user)
 #   collaborators.where(user: user).first
 # end

  def public?
    self.private != true
  end
end