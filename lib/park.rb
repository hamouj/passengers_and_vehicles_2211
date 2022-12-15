class Park
  attr_reader :name, :admission_price, :vehicles
  
  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
  end

  def add_vehicle(vehicle)
    @vehicles.push(vehicle)
  end

  def list_passengers
    vehicles.map do |vehicle|
      vehicle.passengers.select do |passenger|
        passenger 
      end
    end.flatten
  end

  def revenue
    vehicles.sum do |vehicle|  
    (vehicle.num_adults * admission_price)
    end
  end

  def attendee_names
    list_passengers.map do |passenger|
      passenger.name
    end.sort
  end

  def attendee_minors
    list_passengers.map do |passenger|
      passenger.name if !passenger.adult?
    end.compact.sort
  end

  def attendee_adults
    list_passengers.map do |passenger|
      passenger.name if passenger.adult?
    end.compact.sort
  end 
end