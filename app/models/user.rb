# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible( :full_name, :email, :password, :password_confirmation,
                   :remember_me,
                   :tel, :firm,
                   :occupation, :website, :note, :twitter,
                   :discourse_state, :discourse_subject, :price_confirm, :tag_list )


  defaults :price_confirm => true

  validates_presence_of :full_name
  # validates_presence_of :login
  # validates_uniqueness_of :login

  # validates_format_of :email, :with => RFC822::EMAIL

  # after_create :notify_admin

  has_many :assigned_discourses, :class_name => Discourse.name, :foreign_key => :assigner_id
  has_many :authored_discourses, :class_name => Discourse.name, :foreign_key => :author_id
  has_many :vacancies, :dependent => :destroy
  has_many :registrations

  # default_scope order(:full_name)

  state_machine :discourse_state, :initial => :maybe do
    state :maybe
    state :yes
    state :no
  end

  acts_as_taggable
  acts_as_taggable_on :tags

  def to_s
    firm? ? "#{full_name} (#{firm})" : full_name
  end

  def anti_email
     email.gsub('@',' [собачка] ')
   end

  def show_tag_list
    tag_list
  end

  def show_website
    "<a href=\"#{website}\">#{website}</a>".html_safe
  end

  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    update_attributes(params)
  end

  def notify_admin
    Notifier.notify_admin_about_newbie(self).deliver!
  end

  def to_label
    to_s
  end

  def self.typus_constantize
    self
  end

  #совпадает ли настоящая роль пользователя с предлагаемой base_role
  #role - хранится в БД и имеет вид, н-р "admin"
  def role?(base_role)
    base_role==role
  end

  protected

  # def password_required?
  #   !persisted? || password.present? || password_confirmation.present?
  # end

end



# == Schema Information
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  confirmation_token   :string(255)
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  authentication_token :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  full_name            :string(255)     not null
#  firm                 :string(255)
#  website              :string(255)
#  occupation           :string(255)
#  note                 :text
#  discourse_state      :string(255)
#  discourse_subject    :string(255)
#  price_confirm        :boolean         default(TRUE), not null
#  twitter              :string(255)
#  tel                  :string(255)
#  invest_money         :decimal(, )     default(0.0), not null
#  role                 :string(255)
#

