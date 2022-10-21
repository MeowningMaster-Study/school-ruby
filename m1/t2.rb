# variant 10

DESTINATIONS = %w[Porto Freetown Warsaw Dublin Jakarta]

#noinspection RubyInstanceMethodNamingConvention
class Train
  def initialize(destination, number, departure_time, number_of_seats)
    @destination = destination
    @number = number
    @departure_time = departure_time
    @number_of_seats = number_of_seats
  end

  def getDestination
    @destination
  end

  def setDestination=(destination)
    @destination = destination
  end

  def getNumber
    @number
  end

  def setNumber=(number)
    @number = number
  end

  def getDepartureTime
    @departure_time
  end

  def setDepartureTime=(departure_time)
    @departure_time = departure_time
  end

  def getNumberOfSeats
    @number_of_seats
  end

  def setNumberOfSeats=(number_of_seats)
    @number_of_seats = number_of_seats
  end

  def self.generate_array
    Array.new(10) do
      Train.new(
        DESTINATIONS.sample,
        rand(0...1000),
        [rand(0...24), rand(0...60)],
        [rand(0...40), rand(0...40), rand(0...40), rand(0...40)]
      )
    end
  end

  def padTime(n)
    n.to_s.rjust(2, "0")
  end

  def toString
    format("Destination: %s\nNumber: %d\nDeparture time: %s:%s\nSeats (general, compartment, reserved seat, lux): %s\n", @destination, @number, padTime(@departure_time[0]), padTime(@departure_time[1]), @number_of_seats.join(", "))
  end

  def self.filter_a(array, destination)
    array.select { |t| t.getDestination == destination }
  end

  def self.filter_b(array, destination, hour)
    array.select { |t| t.getDestination == destination && t.getDepartureTime[0] > hour }
  end

  def self.filter_c(array, destination)
    array.select { |t| t.getDestination == destination && t.getNumberOfSeats[0] > 0 }
  end
end

def print_arr(arr)
  arr.each do |t|
    print t.toString
    print "\n"
  end
end

if $PROGRAM_NAME == __FILE__
  arr = Train.generate_array
  print_arr arr

  destination = DESTINATIONS.sample
  print "Task A (#{destination})\n"
  a = Train.filter_a(arr, destination)
  print_arr a

  destination2 = DESTINATIONS.sample
  hour = rand(0...24)
  print "Task B (#{destination2}, #{hour})\n"
  b = Train.filter_b(arr, destination2, hour)
  print_arr b

  destination3 = DESTINATIONS.sample
  print "Task C (#{destination3})\n"
  c = Train.filter_c(arr, destination3)
  print_arr c
end