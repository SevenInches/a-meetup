class User < ActiveRecord::Base
  has_secure_password

  has_many :comments
  has_many :issues

  before_create :generate_authentication_token

  validates :name, :email, presence: true
  validates :name, :email, uniqueness: { case_sensitive: false }


  def generate_authentication_token 
    loop do 
      self.authentication_token = SecureRandom.base64(64) 
      break unless User.find_by(authentication_token: authentication_token) 
    end 
  end

  def reset_authentication_token!
    generate_authentication_token
    save
  end


  def avatar
    gravatar_id = Digest::MD5.hexdigest(self.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=512&d=retro"
  end  

end
