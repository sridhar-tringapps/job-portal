class JobPolicy < ApplicationPolicy
    attr_reader :current_user, :user
  
    def initialize(current_user, user)
      @user = user
      @current_user = current_user
    end
  
    def index?
        @current_user.admin? or @current_user.user?
    end
    def create?
      @current_user.admin?
    end
    def new?
      create?
    end
    def apply?
      @current_user.user?
    end
    def update?
      @current_user.admin?
    end
    def edit?
      update?
    end
    def destroy?
      @current_user.admin?
    end
  end
  