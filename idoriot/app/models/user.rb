require 'bcrypt'

class User
  include BCrypt

  attr_accessor :username
  attr_reader :id, :password_hash

  @@users = []

  def initialize(username, password)
    @username = username
    @password_hash = Password.create(password)
    @id = @@users.length + 1
  end

  def self.create(username, password)
    return nil if username.blank? || password.blank?
    return nil if @@users.any? { |user| user.username == username }
    user = new(username, password)
    @@users << user
    user
  end

  def self.find_by_id(id)
    @@users.find { |user| user.id == id.to_i }
  end

  def self.find_by_username(username)
    @@users.find { |user| user.username == username }
  end

  def authenticate(password)
    Password.new(@password_hash) == password
  end
end
