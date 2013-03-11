class EntriesController < ApplicationController
  def index 
    @entries = Entry.all
    respond_to do |format|
      format.json { render :json => { :resource => @entries } }
      format.html { render }
    end
  end

  def show
    @entry = Entry.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  ensure
    respond_to do |format|
      format.json do 
        response = { :json => {} }
        response[:json][:resource] = @entry unless @entry.nil?
        response[:json][:errors] = ["Entry with id: #{params[:id]} was not found."] if @entry.nil?
        response[:status] = 400 if @entry.nil?
        render response
      end
    end
  end

  def update
    @entry = Entry.find(params[:id])
    success = @entry.update_attributes(params[:entry])
  rescue ActiveRecord::RecordNotFound
  ensure
    respond_to do |format|
      format.json  do
        response = { :json => {} }
        response[:json][:resource] = @entry unless @entry.nil?
        if @entry.nil?
          response[:json][:errors] = ["Entry with id: #{params[:id]} was not found."]
        elsif !success
          response[:json][:errors] = @entry.errors.full_messages 
        end
        response[:status] = 400 unless success
        render response
      end
    end
  end

  def edit
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry])
    success = @entry.save
    respond_to do |format|
      format.json do
        response = { :json => { :resource => @entry } }
        response[:json][:errors] = @entry.errors.full_messages unless success
        response[:status] = 400 unless success
        render response
      end
      format.html do
        if success
          flash[:success] = 'The Entry was created successfully!'
          redirect_to entries_path
        else
          render 'new'
        end
      end
    end
  end

  def destroy
    success = Entry.destroy(params[:id])
  rescue ActiveRecord::RecordNotFound
    success = false
  ensure
    respond_to do |format|
      format.json do 
        response = { :json => {} }
        response[:json][:errors] = ["Entry with id: #{params[:id]} was not found."] unless success
        response[:status] = 400 unless success
        render response
      end
    end
  end
end
