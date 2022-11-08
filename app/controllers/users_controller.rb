class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :authenticate_user!, except: %i[index show]

  def show
    @hosted_events = current_user.events.all
    @attend_events = current_user.attended_events
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
