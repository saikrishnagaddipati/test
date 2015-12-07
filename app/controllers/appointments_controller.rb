class AppointmentsController < ApplicationController
  def new
    @pets = Pet.includes(:customer).all
  end

  def create
    pet = Pet.includes(:customer).where(id: params[:pet].to_i).first

    appointment = Appointment.create_from_hash({
      date_of_visit: Date.parse(params[:date_of_visit]),
      pet: pet,
      customer: pet.customer,
      reminder_required: (params[:reminder_required].to_s == 'on'),
      reason_for_visit: params[:reason_for_visit]
    })

    @result = "An appointment is created for the pet #{pet.name} on #{appointment.date_of_visit}."
  rescue => error
    logger.error("#{error.message}\n#{error.backtrace.join("\n")}")
    @result = error.message
  end

  def show
    @appointments = Appointment.includes(:pet).where('person_id = ? and date_of_visit > ?', params[:id], Time.now)
  end
end
