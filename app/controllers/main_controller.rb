require 'yaml'

class MainController < ApplicationController
  def index
    @entries = Entry.order('created_at DESC')
  end

  def about
  end

  def search
    @entries = Entry.search_by_all(params[:search_terms])
    @search_terms = params[:search_terms]
  end
end
