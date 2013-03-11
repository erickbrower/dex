class MainController < ApplicationController
  def index
    @entries = Entry.all
  end

  def about
  end
end
