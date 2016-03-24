class SiteController < ApplicationController
  def index

  end

  def search
    render action: 'search', layout: false
  end
end
