class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :email, presence: true, uniqueness: { case_sensitive: true },
                    format: { with: /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/ }
  validates :encrypted_password, presence: true, length: { minimum: 6 } 

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
  validates :encrypted_password, format: { with: VALID_PASSWORD_REGEX }
  validates :reading_first_name, :reading_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date, presence: true
end
