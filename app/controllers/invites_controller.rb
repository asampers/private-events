class InvitesController < ApplicationController
  before_action :authenticate_user!

  def new
    @invite = current_user.invites.build
  end

  def create
    @invite = current_user.invites.build(inivitation_params)
    
    if @invite.save
      flash[:notice] = 'You joined the event!'
      redirect_to event_path(params[:invite][:event_id])
    else 
      render :new, status: :unprocessable_entity
    end      
  end

  private

  def inivitation_params
    params.require(:invite).permit(:event_id, :user_id)
  end
end
