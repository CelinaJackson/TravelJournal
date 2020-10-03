class User < ActiveRecord::Base
    has_secure_password
    validates_presence_of :name, :email

    validates :email, :presence => true, :uniqueness => true, :format => {:with => /\w+@\w+\.\w+/}
    
    has_many :trip
 
end 