class SkillsController < ApplicationController
  def index
    @user = User.find(session[:current_user]['id'])
    @skills = @user.skills
  end
  def new
    @skill = Skill.new
  end
  def create
    puts "-------------->", skill_params
    @skill = User.find(session[:current_user]['id']).skills << Skill.create(skill_params)
    if @skill
      redirect_to skills_all_path
    else
      render :new, status: :unprocessable_entity
    end
  end



  private
  def skill_params
    params.require(:skill).permit(:skill_name)
  end
end
