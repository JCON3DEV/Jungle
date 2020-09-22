class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: 3..20
  validates :email, :uniqueness => { :case_sensitive => false }

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def self.authenticate_with_credentials
    @user = User.new.find_by_email(params[:email]).authenticate(params[:password])
  end


end
