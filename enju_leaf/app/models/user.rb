class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, #:validatable, 
      :lockable, :lock_strategy => :none, :unlock_strategy => :none
  include EnjuSeed::EnjuUser

end
