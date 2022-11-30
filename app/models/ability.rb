# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)


    #   if user.admin?
  #     can :manage,  :all

  #   else
  #     can :update, Book do |book|
  #       books.user == user
  #     end
  #     can :destroy, Book do |book|
  #       books.user == user
  #     end
  #     can :read, Book do |book|
  #       books.user == user
  #     end
  #     can :create, Book
  #   end

    # Define abilities for the user here. For example:
    #
    # return unless user.present?  # additional permissions for logged in users (they can read their own posts)
    # can :read, Book, user: user

    # return unless user.role == 'admin'  # additional permissions for administrators
    # can :manage, Book
      # return unless user.present?
      # debugger
      can :manage,  :all if user.role == 'admin' || user.role == 'manager'
      can [:read ],  Book   if user.role == 'student'

      
      can [:read, :destroy], BorrowHistory   if user.role == 'student'

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
