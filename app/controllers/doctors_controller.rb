class DoctorsController < ApplicationController
  def index
    @doctors = Person.doctors
  end
end
