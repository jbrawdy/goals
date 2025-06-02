class HomeController < ApplicationController
  allow_unauthenticated_access only: %i[ home ]
  before_action :resume_session, only: %i[home]



  def home
  end

end
