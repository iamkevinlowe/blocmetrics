class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.visible_to current_user
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    @registered_application.user = current_user
    if @registered_application.save
      flash[:notice] = "Registered \"#{@registered_application.name}\" successfully."
      redirect_to @registered_application
    else
      flash[:error] = "There was an error creating a registered application. Please try again."
      redirect_to registered_applications_path
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.update_attributes(registered_application_params)
      flash[:notice] = "Updated \"#{@registered_application.name}\" successfully."
      redirect_to @registered_application
    else
      flash[:error] = "There was an error updating \"#{@registered_application.name}\". Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "Removed \"#{@registered_application.name}\" successfully."
      redirect_to registered_applications_path
    else
      flash[:notice] = "There was an error removing \"#{@registered_application.name}\". Please try again."
      redirect_to @registered_application
    end
  end

  private

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end
end
