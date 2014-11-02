class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable#, :validatable
  has_many :activities
  has_paper_trail
  before_create :default_role

  private

  def default_role
    self.role = 'user'
  end
end
