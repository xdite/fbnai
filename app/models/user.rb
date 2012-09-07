# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  extend OmniauthCallbacks

  has_many :articles, :foreign_key => "author_user_id"
  has_many :user_media_ship
  has_many :media, :through => :user_media_ship
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  

  # http://ar.rubyonrails.org/classes/ActiveRecord/Validations/ClassMethods.html#M000087
  # validate 請參考
 # validate :validate_address


  def validate_adddress
    if address.not_suitable_for_standar_format?
       errors.add(:field, '地址部隊')
    end
  end

  def normal?
    true
  end

  def is_admin?
    Setting.admin_emails.include?(email)
  end


  def bind_service(response)
    # fb
    provider = response["provider"]
    uid = response["uid"]
    update_attribute(:fb_id, uid)
  end
  
  def facebook_user?
    fb_id.to_i > 0
  end

end
