class Wiki < ApplicationRecord
  belongs_to :user

  default_scope { order('created_at DESC') }
  scope :visable_to, -> (user) do 
    return all if user.premium? || user.admin?
    where(private: [false, nil])
  end

  def set_initial_privacy
    self.private ||= :false # defining the initial / default privacy 
  end
  
  validates :user, presence: true
  
end
