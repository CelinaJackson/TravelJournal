class User < ActiveRecord::Base
    has_many :trips
    has_secure_password
    validates_presence_of :name, :email, :password

    validates :email, :presence => true, :uniqueness => true, :format => {:with => /\w+@\w+\.\w+/}

    # def self.authenticate(params)
    # @user = User.find_by_name(params[:username])
    #     (@user && @user.password == params[:password]) ? user : nil
    # end
end 