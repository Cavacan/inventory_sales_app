class ApplicationController < ActionController::Base
  # Sorceryが提供するヘルパーメソッドをビューでも利用可能に
  helper_method :current_user, :logged_in?

  private

  # Sorceryのcurrent_userをそのまま利用
  def logged_in?
    current_user.present?
  end
end