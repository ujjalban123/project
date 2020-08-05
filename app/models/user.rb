class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
      

  has_one_attached :avatar
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :images, dependent: :destroy
  has_many :videos, dependent: :destroy
  
  
  acts_as_voter
  
  acts_as_followable

  acts_as_follower

 

  def search_data
  {
    first_name: first_name,
    last_name: last_name
  }
end

  def full_name
    [first_name, last_name].join(' ')
  end
    
   def avatar_thumbnail
     if avatar.attached? 
          return self.avatar.variant(resize: '150*150!')
     else
      '/default_profile.jpg' 
    
   end
  end
 end   
