require 'spec_helper'
require 'factories'

describe EntriesController do

  before { FactoryGirl.create_list(:entry, 50) }

  describe 'GET #index' do
    context 'when sending Content-Type json' do
      before :each do
        request.env['HTTP_ACCEPT'] = 'application/json'
        request.env['CONTENT_TYPE'] = 'application/json'
      end

      it 'should return a list of Entries' do
        get :index
        results = JSON.parse response.body
        results['resource'].size.should == 50 
      end
    end
  end

  describe 'GET #show' do
    context 'when sending Content-Type json' do
      before :each do
        request.env['HTTP_ACCEPT'] = 'application/json'
        request.env['CONTENT_TYPE'] = 'application/json'
      end

      it 'should return the Entry specified by id' do
        entry = Entry.first
        get :show, :id => entry.id
        result = JSON.parse response.body
        result['resource']['id'].should == entry.id
      end

      it 'should return an error if not found' do
        get :show, :id => 100
        response.code.should == '400'
        result = JSON.parse response.body
        result['errors'].size.should > 0
      end
    end
  end

  describe 'POST #create' do
    context 'when sending Content-Type json' do
      before :each do
        request.env['HTTP_ACCEPT'] = 'application/json'
        request.env['CONTENT_TYPE'] = 'application/json'
      end

      it 'should create a new Entry successfully' do
        entry = FactoryGirl.build(:entry)
        data = { 
          :format => 'json', 
          :entry => { 
            :content => entry.content, 
            :title => entry.title, 
            :etype => entry.etype 
          } 
        }
        post :create, data
        response.code.should == '200'
        Entry.count.should == 51
      end

      it 'should return errors on failure' do
        data = { :format => 'json', :entry => { :content => '' } }
        post :create
        response.code.should == '400'
        result = JSON.parse response.body
        result['errors'].size.should > 0
      end
    end
  end

  describe 'PUT #update' do
    context 'when sending Content-Type json' do
      before :each do
        request.env['HTTP_ACCEPT'] = 'application/json'
        request.env['CONTENT_TYPE'] = 'application/json'
      end

      it 'should update the Entry specified by id' do
        entry = Entry.first
        data = { :id => entry.id, :format => 'json', :entry => { :content => 'TESTY!' } }
        put :update, data
        response.code.should == '200'
        entry.reload
        entry.content.should == 'TESTY!'
      end

      it 'should return errors if not found' do
        put :update, :id => 100
        response.code.should == '400'
        result = JSON.parse response.body
        result['errors'].size.should > 0
      end

      it 'should return errors on failure' do
        entry = Entry.first
        data = { :id => entry.id, :format => 'json', :entry => { :content => '' } }
        put :update, data
        response.code.should == '400'
        result = JSON.parse response.body
        result['errors'].size.should > 0
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when sending Content-Type json' do
      before :each do
        request.env['HTTP_ACCEPT'] = 'application/json'
        request.env['CONTENT_TYPE'] = 'application/json'
      end

      it 'should destroy the Entry specified by id' do
        entry = Entry.first
        delete :destroy, :id => entry.id
        response.code.should == '200'
        Entry.count.should == 49 
      end

      it 'should return errors if not found' do
        delete :destroy, :id => 100
        response.code.should == '400'
        result = JSON.parse response.body
        result['errors'].size.should > 0
      end
    end
  end
end
