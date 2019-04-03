class User < ApplicationRecord
    validates :username, :presence => {:message => 'Must have username'}, uniqueness: true
    validates :session_token, :presence:true
    validates :password_digest, :presence => {:message => 'Password cant be blank'}, uniqueness: true
end
