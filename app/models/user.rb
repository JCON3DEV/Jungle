class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: 3..20
  validates :email, uniqueness: { case_sensitive: false }

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def authenticate_with_credentials(params[:email], params[:password])
    @user = User.new
  end


end
