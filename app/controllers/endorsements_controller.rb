class EndorsementsController < ApplicationController
  def index
  end
  def create
    puts "------------------->", params
    # @endorsement = UserSkill.find(params['id']).skill.endorsements << Endorsement.create(user_skill_id: params['id'], user_id: session[:current_user]['id'])
    @endorsement = Endorsement.create(user_skill_id: params['id'], user_id: session[:current_user]['id'])
    if @endorsement
      redirect_back(fallback_location: root_path)
    end
    # puts "--------->", params
  end

  private
  # def endorsement_params
  #   params.require(:id).permit(:id)
  # end
end
