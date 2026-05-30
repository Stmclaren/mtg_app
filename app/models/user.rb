class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_profile_with_signup_data
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :last_name, length: { minimum: 1 }

  private

  def create_profile_with_signup_data
    create_profile(
      first_name: self.first_name,
      last_name: self.last_name,
    )
  end
end
