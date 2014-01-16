# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_type_id    :integer          not null
#  username        :string(255)      not null
#  email           :string(255)      not null
#  first_name      :string(255)      not null
#  last_name       :string(255)      not null
#  city            :string(255)
#  state           :string(255)
#  birthday        :date
#  password_digest :string(255)      not null
#  points          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :username, :user_type_id, :password, :email, :first_name, :last_name
  attr_reader :password

  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true
  validates :username, :user_type_id, :email, :first_name, :last_name, :presence => true
  validates :username, :email, :uniqueness => true

  after_initialize :ensure_session_token

  has_many :reviews
  has_many :book_statuses
  has_many :books, :through => :book_statuses
  belongs_to :user_type

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)

    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
