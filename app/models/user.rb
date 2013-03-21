class User < ActiveRecord::Base
  attr_accessible :email, :password_hash, :password_salt, :password, :password_confirmation
  attr_accessor :password

  belongs_to :tennis_player, :polymorphic => true

  before_save :encrypt_password

  validates_confirmation_of :password
  validates_confirmation_of :password, :on => :create
  validates_confirmation_of :email
  validates_uniqueness_of :password

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_seceret(password, user.password_salt)
      user 
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
