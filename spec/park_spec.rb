require './lib/passenger'
require './lib/vehicle'
require './lib/park'

describe Park do
  let(:park) {Park.new('Park Jasmine', 5)}
  let(:vehicle_1) {Vehicle.new('2001', 'Honda', 'Civic')}
  let(:vehicle_2) {Vehicle.new('2021', 'Nissan', 'Rogue')}
  let(:vehicle_3) {Vehicle.new('2019', 'Dodge', 'Ram')}
  let(:charlie) {Passenger.new({'name' => 'Charlie', 'age' => 18})}
  let(:taylor) {Passenger.new({'name' => 'Taylor', 'age' => 12})}
  let(:jude) {Passenger.new({'name' => 'Jude', 'age' => 20})}
  let(:ivan) {Passenger.new({'name' => 'Ivan', 'age' => 36})}
  let(:hailey) {Passenger.new({'name' => 'Hailey', 'age' => 1})}

  describe 'Iteration 3' do
    it 'exists' do
      expect(park).to be_a(Park)
    end

    it 'has attributes' do
      expect(park.name).to eq('Park Jasmine')
      expect(park.admission_price).to eq(5)
    end

    it 'has no vehicles by default' do
      expect(park.vehicles).to eq([])
    end
  
    it 'can add vehicles and list them' do
      park.add_vehicle(vehicle_1)
      park.add_vehicle(vehicle_2)
      park.add_vehicle(vehicle_3)

      expect(park.vehicles).to eq([vehicle_1, vehicle_2, vehicle_3])
    end

    it 'can list passengers in the park' do
      park.add_vehicle(vehicle_1)
      park.add_vehicle(vehicle_2)
      park.add_vehicle(vehicle_3)
    
      vehicle_1.add_passenger(charlie)
      vehicle_2.add_passenger(taylor)
      vehicle_2.add_passenger(jude)
      vehicle_3.add_passenger(ivan)

      expect(park.list_passengers).to eq([charlie, taylor, jude, ivan])
    end

    it 'can determine revenue generated' do
      park.add_vehicle(vehicle_1)
      park.add_vehicle(vehicle_2)
      park.add_vehicle(vehicle_3)
    
      vehicle_1.add_passenger(charlie)
      vehicle_2.add_passenger(taylor)
      vehicle_2.add_passenger(jude)
      vehicle_3.add_passenger(ivan)

      expect(park.revenue).to eq(15)
    end
  end

  describe 'Iteration 4' do 
    before(:each) do
      park.add_vehicle(vehicle_1)
      park.add_vehicle(vehicle_2)
      park.add_vehicle(vehicle_3)
      
      vehicle_1.add_passenger(charlie)
      vehicle_2.add_passenger(taylor)
      vehicle_2.add_passenger(jude)
      vehicle_3.add_passenger(ivan)
      vehicle_3.add_passenger(hailey)
    end 

    it 'can list the names of attendees' do
      expect(park.attendee_names).to eq(['Charlie', 'Hailey', 'Ivan', 'Jude', 'Taylor'])
    end

    it 'can list attendees who are minors' do
      expect(park.attendee_minors).to eq([hailey, taylor])
    end

    it 'can list attendees who are adults' do
      expect(park.attendee_adults).to eq([charlie, ivan, jude])
    end
  
    it 'can list the names of attendees who are minors' do
      expect(park.names_attendee_minors).to eq(['Hailey', 'Taylor'])
    end

    it 'can list the names of attendees who are adults' do
      expect(park.names_attendee_adults).to eq(['Charlie', 'Ivan', 'Jude'])
    end
  end 
end