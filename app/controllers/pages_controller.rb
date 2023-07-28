class PagesController < ApplicationController
  def home
    # temporary fix -- id may change
    @page = Page.find(2)
  end
end
