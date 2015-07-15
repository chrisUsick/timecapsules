class WelcomeController < ApplicationController
  def index
  end
  def home
    @capsules = current_user.capsules.where("sendDate <= ?", Date.today().next_month)
  end
end
