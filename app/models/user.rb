class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :authentication_keys => [:login] # , :validatable
  has_many :activities
  has_paper_trail
  before_create :default_role
  validates :username, uniqueness: { case_sensitive: false }

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

   def self.find_first_by_auth_conditions(warden_conditions)
     conditions = warden_conditions.dup
     if login = conditions.delete(:login)
       where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
     else
       where(conditions).first
     end
   end

  private

  def default_role
    self.role = 'user'
  end
end
