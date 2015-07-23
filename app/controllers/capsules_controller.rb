class CapsulesController < ApplicationController
  before_action :authenticate_user!

  def index
    @capsules = current_user.capsules.all
  end

  def show
    @capsule = Capsule.find params[:id]
    @send_email_path = (capsule_path(@capsule)) + '/send_capsule'
  end

  def new
    @capsule = current_user.capsules.new
  end

  def edit
    @capsule = Capsule.find params[:id]
  end

  def create
    @user = current_user
    # render plain: params[:capsule].inspect
    @capsule = @user.capsules.new(capsule_params)
    @set_send_date
    if @capsule.save
      redirect_to @capsule
    else
      render 'new'
    end
  end

  def update
    @capsule = Capsule.find params[:id]
    @capsule.update capsule_params
    @set_send_date
    if @capsule.save
      redirect_to @capsule
    else
      render 'edit'
    end
  end

  def set_send_date
    if @capsule.monthlyInterval
      @capsule.sendDate = @capsule.eventDate
      @capsule.sendDate.change(month: Date.today.next_month.mon) 
    else
      @capsule.sendDate = @capsule.eventDate
      @capsule.sendDate.change(year: Date.today.next_year.year) 
    end
  end

  def destroy
    @capsule = Capsule.find params[:id]
    @capsule.destroy
    redirect_to capsules_path
  end

  def sendCapsule
    @capsule = Capsule.find params[:id]
    CapsuleMailer.send_capsule(current_user, @capsule).deliver_later
    redirect_to @capsule, notice: 'Email sent'
  end


  private
  def capsule_params
    params.require(:capsule).permit(:title, :message, :eventDate, :monthlyInterval)
  end
end
