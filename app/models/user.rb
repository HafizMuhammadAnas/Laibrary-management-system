# frozen_string_literal: true

class User < ApplicationRecord
  def self.admin?
    role == 'admin'
  end

  has_one_attached :profile_image
  has_many :books
  has_many :borrow_histories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         authentication_keys: [:login]
  validates :username, presence: true, uniqueness: true


  #  enum role: %i[admin manager student]
  attr_accessor :login

  def login
    @login || username || email
  end
  scope :std_list, -> { where(role: 'student') }
  scope :lib_list, -> { where(role: 'manager') }
  private

  # def after_confirmation
  #   WelcomeMailer.send_greetings_notification(self)
  #                .deliver_now
  # end

  def self.find_for_authentication(warden_condition)
    conditions = warden_condition.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value ',
                                    { value: login.downcase }]).first
    elsif conditions.has_keys?(:username) || conditions.has_keys?(:email)
      where(conditions.to_h).first
    end
  end
end
