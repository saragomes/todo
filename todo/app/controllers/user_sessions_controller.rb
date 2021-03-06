class UserSessionsController < ApplicationController

  before_filter :require_user, :only => :destroy
  
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @user_session }
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    respond_to do |format|
      if @user_session.save
        format.html { redirect_to(:tasks, :notice => 'Login Successful') }
        format.xml { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        @user = User.new
        format.html { render :action => "new" }
        format.xml { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_session = UserSession.find
    @user = User.new
    @user_session.destroy
    respond_to do |format|
      @user_session = UserSession.new
      format.html { render :action => "new", :notice => 'Goodbye!' }
    end
  end

end
