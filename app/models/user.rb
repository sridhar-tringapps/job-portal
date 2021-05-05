class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_applications
  has_many :jobs, through: :job_applications


  enum role: [:user, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :user
    end
  end
  
end
