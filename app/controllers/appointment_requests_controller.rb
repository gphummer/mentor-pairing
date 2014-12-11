class AppointmentRequestsController < ApplicationController
  def new
    @availability = Availability.find_by_id(params[:availability_id])
    return redirect_to availabilities_path unless @availability.present?
  end

  def create
    @availability = Availability.find_by_id(params[:availability_id])
    mentee = User.find_by_email(params[:email])

    if mentee && mentee.activated?
      AppointmentRequest.create!(:mentee => mentee, :availability => @availability)
      mentee.send_appointment_request(@availability)
      render :show
      return
    end

    if mentee.nil?
      mentee = User.create!(user_params)
    end

    mentee.send_activation
    flash.now[:notice] = "Please go check your email, ok? Then come back and re-submit."
    render :new
  end
end
