class ProjectsController < ApplicationController

  before_action :authenticate_user!,  except: [:index, :show]
  before_action :set_user_project,    only:   [:edit,  :update, :destroy]
  before_action :set_project,         only:   [:show]


  # Prikazi aktivne projekte
  def index
    @projects = Project.where(aktivan: true).all
  end


  # Prikazi izabrani projekat
  def show
  end


  def new
    @project = Project.new
  end


  def edit
  end


  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: 'Projekat je uspesno kreiran.'
    else
      render :new
    end
  end


  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Projekat je uspesno izmenjen.'
    else
      render :edit
    end
  end


  # DELETE /projects/1  

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Projekat je uspesno obrisan.'
  end


  private


  def set_project
    @project = Project.find(params[:id])
  end


  def set_user_project
    projects = Project.where(user_id: current_user.id).all
    @project = projects.find(params[:id])
  end


  def project_params
    params.require(:project).permit(:naziv, :opis, :ukupno, :do_sada, :aktivan)
  end

end
