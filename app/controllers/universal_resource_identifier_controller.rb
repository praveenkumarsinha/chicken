class UniversalResourceIdentifierController < ApplicationController

  def create
    redirect_back(fallback_location: root_path)
  end
  
end
