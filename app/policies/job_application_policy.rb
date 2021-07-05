# frozen_string_literal: true

class JobApplicationPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @user = user
    @current_user = current_user
  end

  def index?
    @current_user.admin?
  end

  def create?
    @current_user.admin?
  end

  def new?
    create?
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
