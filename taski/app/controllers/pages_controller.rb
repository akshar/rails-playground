class PagesController < ApplicationController
  def contact
  end

  def home
    @projects = Project.all
  end

  def about
  end

  def error
  end
end
