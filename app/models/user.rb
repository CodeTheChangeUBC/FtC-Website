class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token
  has_and_belongs_to_many :events
  before_save :downcase_email
  before_create :create_activation_digest
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validate :avatar_size
  validates :about, length: { maximum: 1000 }
  # Here allow_nil: true for the password only takes effect when user is editing
  # their account. This does not allow user to sign up with no password. 

  # Returns the hash digest of the given string. For testing user login/logout 
  # functionality. 
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
  	SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions
  def remember
  	self.remember_token = User.new_token
  	update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
  	return false if digest.nil?
  	BCrypt::Password.new(digest).is_password?(token)
  end

  # Activates an account
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  # Sends activation email
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Forgets a user, allowing them to logout
  def forget
  	update_attribute(:remember_digest, nil)
  end

  # Sets the password reset attributes
  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  # Send password reset email
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # Make this user an exec
  def make_exec
    update_attribute(:exec, true)
  end

  # Unmake this user an exec
  def unmake_exec
    update_attribute(:exec, false)
  end

  # Sign user up for an event
  def sign_up_for_event(event)
    self.events << event unless self.events.include?(event)
  end

  # Opt user of out event
  def opt_out_of_event(event)
    self.events.delete(event) unless !self.events.include?(event)
  end

  # Return true if user has image_url != nil
  def picture
    if self.avatar?
      self.avatar.url
    elsif self.image_url != nil
      self.image_url
    else
      'generic_avatar'
    end
  end

  # For APIs
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name unless user.name != nil
      user.email =  SecureRandom.hex + '@example.com' unless user.email != nil
      user.image_url = auth.info.image # unless (user.avatar? || user.image_url != nil) 
      user.activated = true
      user.activated_at = Time.zone.now unless user.activated_at != nil
      user.password = SecureRandom.urlsafe_base64 unless user.password != nil
      user.save! 
    end
  end


  private 

    # Converts email to lowercase 
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest
    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

    # Validates the size of an uploaded avatar
    def avatar_size
      if avatar.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
