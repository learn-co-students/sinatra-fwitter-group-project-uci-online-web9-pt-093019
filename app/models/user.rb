class User < ActiveRecord::Base

  validates :username, :email, :password, presence: true
  
  has_secure_password
  has_many :tweets

  def slug
    split_username = self.username.split(" ")
    split_username.map {|word| word.downcase}.join("-")  
  end

  def self.find_by_slug(input)
    split_input = input.split("-")
    input_username = split_input.map {|word| word.downcase}.join(" ")
    instance = self.find_by("LOWER(username)= ?", input_username)
  end 
end
