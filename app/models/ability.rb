class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.is_administrator?
      can :manage, :all
    elsif user.is_customer?
      puts "Add some abilities to Customer"
    elsif user.is_vendor?
      puts "Add some abilities to Vendor"
    end
  end
end