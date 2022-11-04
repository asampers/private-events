class UsersController < ApplicationController
  #before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show]

  def show
    @events = current_user.events.all
  end

end
