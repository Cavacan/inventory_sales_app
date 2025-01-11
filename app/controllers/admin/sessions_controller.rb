module Admin
  class SessionsController < ApplicationController
    def new
    end

    def create
      user = login(params[:email], params[:password])
      if user&.admin?
        redirect_to admin_dashboard_path, notice: 'ログインしました。'
      else
        logout
        flash[:alert] = "管理者権限がありません。"
        render :new
      end
    end

    def destroy
      logout
      redirect_to root_path, notice: "ログアウトしました。"
    end
  end
end
