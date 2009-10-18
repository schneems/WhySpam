
class UsersController < ApplicationController  
  layout "application", :except => [:test, :localtest]

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.admin = User.count.zero?
    if @user.save
      flash[:success] = "Account registered!"
      redirect_back_or_default root_path
    else
      render :action => :new
    end
  end
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  
  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if params[:user][:email] == @user.email
       render :action => :edit
      else
        if @user.update_attributes(params[:user])  ## can't change email address
          flash[:success] = "Account updated!"
          redirect_to account_path
        else
          render :action => :edit
        end
    end
    
  end

end
