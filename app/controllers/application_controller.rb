class ApplicationController < ActionController::Base


  protected
  #ログイン後遷移先
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admin_customers_path
    else
        root_path
    end
  end

    #ログアウト後遷移先
    def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
    end
    
    def ensure_normal_customer
      if current_customer.email == 'guest@email.com'
        redirect_to root_path, alert: 'ゲストユーザーとしてログイン中のため実行できません。'
      end
    end
end
