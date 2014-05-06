class HomeController < ApplicationController
  before_filter :require_login
  
  def index
  end

  def secret
  end
end
