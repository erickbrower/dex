class EntriesController < ApplicationController
  def index 
    @entries = Entry.all
    respond_to do |format|
      format.json { render :json => @entries }
    end
  end

  def show
    @entry = Entry.find(params[:id])
    respond_to do |format|
      format.json { render :json => @entry }
    end
  end

  def update
    @entry = Entry.find(params[:id])
    status = @entry.update_attributes(params[:entry])
    respond_to do |format|
      format.json  do
        render :json => { :status => status, :resource => @entry }
      end
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      format.json do
        @entry = Entry.new(params[:entry])
        render :json => { :status => @entry.save, :resource => @entry }
      end
    end
  end

  def new
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy unless @entry.nil?
    respond_to do |format|
      format.json { render :json => { :status => !@entry.nil? } }
    end
  end
end
