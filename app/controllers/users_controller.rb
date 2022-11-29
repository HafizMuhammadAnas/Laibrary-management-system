# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_user, only: %i[show destroy]

  def index
    @user = User.all
  end

    # def index
    #   @user = User.std_list  if params[:show] == 'student_list'
    #   @user = User.lib_list if params[:show] == 'librarian_list'
    # end

  def show; end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path, alert: 'User has been deleted successfuly'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
