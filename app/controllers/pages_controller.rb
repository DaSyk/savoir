class PagesController < ApplicationController

  def home
	  @page = Page.find_by_title("Startseite")
  end

  def impressum
	  @page = Page.find_by_title("Impressum")
  end

  def notes
    @page = Page.find_by_title("Buchungshinweise")
  end

end
