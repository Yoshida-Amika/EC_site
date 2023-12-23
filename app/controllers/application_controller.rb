class ApplicationController < ActionController::Base
  # layout 'application'


  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Customer
      root_path

    else
      root_path
    end
  end

  


  private

    def customers_params
      params.require(:customers).permit(:last_name)
    end


end
