class User < ActiveRecord::Base
  include EnjuCirculation::EnjuUser
  include EnjuMessage::EnjuUser
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, #:validatable, 
      :lockable, :lock_strategy => :none, :unlock_strategy => :none
  include EnjuSeed::EnjuUser

end
Item.include(EnjuLibrary::EnjuItem)
Accept.include(EnjuCirculation::EnjuAccept)
Basket.include(EnjuCirculation::EnjuBasket)
CarrierType.include(EnjuCirculation::EnjuCarrierType)
Manifestation.include(EnjuCirculation::EnjuManifestation)
Item.include(EnjuCirculation::EnjuItem)
Profile.include(EnjuCirculation::EnjuProfile)
UserGroup.include(EnjuCirculation::EnjuUserGroup)
Withdraw.include(EnjuCirculation::EnjuWithdraw)
Manifestation.include(EnjuSubject::EnjuManifestation)
