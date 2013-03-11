class MainController < ApplicationController
  def index
    @entries = Entry.order('created_at DESC')
  end

  def about
  end
end
