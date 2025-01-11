module Admin
  class BaseController < ApplicationController
    before_action :require_admin_login

    private

    def require_admin_login
      unless current_user&.admin?
        flash[:alert] = '管理者権限が必要です。'
        redirect_to admin_login_path
      end
    end
  end
end
