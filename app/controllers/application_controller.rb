class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
#デバイス機能実行前にconfigure_permitted_parametersの実行をする。
protect_from_forgery with: :exception

  protected
  def after_sign_in_path_for(resource)
  	case resource
    #ここは、admin_userのclassではなく、シンボルadmin_userの値を受け取る
  	when :admin_user
  		admin_root_path
    #ここは、userのclassではなく、シンボルuserの値を受け取る
  	when :user
  		home_about_path
  	end
  end

  #sign_out後のredirect先変更する。
  def after_sign_out_path_for(resource)
  	case resource
    #ここは、admin_userのclassではなく、シンボルadmin_userの値を受け取る
    when :admin_user
     new_admin_user_session_path
    #ここは、userのclassではなく、シンボルuserの値を受け取る
  	when :user
  		new_user_session_path
  	end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :encrypted_password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :email, :encrypted_password])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
  end
end
