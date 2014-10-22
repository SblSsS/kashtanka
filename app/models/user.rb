class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  #Validations
  validates :first_name, :last_name, presence: true, length: { maximum: 25 }
  validates :phone, numericality: true, if: "phone.present?"

  #Callbacks
  after_create :after_create

  #Scopes
  scope :page, ->(page,limit){limit(limit).offset((page-1)*limit)}

  #Methods----------------------------------------------------------

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def short_name
    "#{self.first_name} #{self.last_name.first}."
  end

  def url_param
    "#{self.id} #{self.name}".parameterize
  end

  def password_required?
    super && provider.blank?
  end

  Role.all.map(&:name).each do |role| 
  	define_method "is_#{role}?" do
  		roles.map(&:name).include? role
  	end
  end

  def self.process_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider   = auth.provider
      user.uid        = auth.uid
      user.email      = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name  = auth.info.last_name
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_url_param( uparam )
    id = uparam.split('-').first
    User.exists?(id) ? User.find( id ) : nil
  end

  private

  def after_create
  	self.roles << Role.find_or_create_by(name: "customer")
  end

  #----------------------------------------------

end
