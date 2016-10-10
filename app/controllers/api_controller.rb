class ApiController < ApplicationController
  def get_rooms
  	@booking = Booking.new
  	check_in = params[:check_in_date]
  	check_out = params[:check_out_date]
  	room_type = params[:room_type] if params[:room_type].present?
  	begin
  		check_in_date = Time.parse(check_in)
  	rescue
  		render json: {response: 'Error', message: "Please fill valid date in (dd-mm-yyyy) format."}
  		return false
  	end
		begin
  		check_out_date = Time.parse(check_out)
  	rescue
  		render json: {response: 'Error', message: "Please fill valid date in (dd-mm-yyyy) format."}
  		return false
  	end
		if (check_in_date < Time.now) || (check_in_date - Time.now > 6.months)
			render json: {response: 'Error', message: "Please fill-in valid date range upto 6 months in (dd-mm-yyyy) format."}
		elsif (check_out_date < Time.now) || (check_out_date - Time.now > 6.months) || (check_in_date > check_out_date)

			render json: {response: 'Error', message: "Please fill-in valid date range upto 6 months in (dd-mm-yyyy) format."}
		else
		if params[:room_type].present? && room_type != '0'
			room_type = room_type.to_i
			unless room_type.between?(1,4)
				render json: {response: 'Error', message: "Please pass valid Room Type Id (1 for Deluxe-room, 2 for Luxury-room, 3 for Luxury-suite or 4 for Presidential-suite)."} 
				return false
			end
		end
		rooms = Room.where.not("EXISTS (SELECT bookings.* FROM bookings where 
			rooms.id = bookings.room_id AND ((bookings.check_in  <= ? AND bookings.check_out >= ?) 
			OR (bookings.check_in < ? AND bookings.check_out >= ?) OR ( ? <= bookings.check_in AND 
			? >= bookings.check_in)))",check_in_date, check_in_date, 
			check_out_date,check_out_date,check_in_date,
			check_out_date).select('id, number, room_type_id')
		if params[:room_type].present? && room_type != '0'
			rooms = rooms.where(room_type_id: room_type)
		end
		rooms = rooms.group_by &:room_type
		deluxe_room = RoomType.find(1)
		deluxe_rooms = rooms[deluxe_room]
		luxury_room = RoomType.find(2)
		luxury_rooms = rooms[luxury_room]
		luxury_suite = RoomType.find(3)
		luxury_suites = rooms[luxury_suite]
		presidential_suite = RoomType.find(4)
		presidential_suites = rooms[presidential_suite]
		total_rooms_available = 0
		total_rooms_available += deluxe_rooms.count if deluxe_rooms.present?
		total_rooms_available += luxury_rooms.count if luxury_rooms.present?
		total_rooms_available += luxury_suites.count if luxury_suites.present?
		total_rooms_available += presidential_suites.count if presidential_suites.present?
		if rooms.present?
			response_message = {response: 'OK', total_rooms_available: total_rooms_available}
			if deluxe_rooms.present?
				response_message[:deluxe_rooms_available] = deluxe_rooms.count
				response_message[:deluxe_rooms] = deluxe_rooms.to_json
				response_message[:deluxe_room] = deluxe_room.to_json
			end
			if luxury_rooms.present?
				response_message[:luxury_rooms_available] = luxury_rooms.count
				response_message[:luxury_rooms] = luxury_rooms.to_json
				response_message[:luxury_room] = luxury_room.to_json
			end
			if luxury_suites.present?
				response_message[:luxury_suites_available] = luxury_suites.count
				response_message[:luxury_suites] = luxury_suites.to_json
				response_message[:luxury_suite] = luxury_suite.to_json
			end
			if presidential_suites.present?
				response_message[:presidential_suites_available] = presidential_suites.count
				response_message[:presidential_suites] = presidential_suites.to_json
				response_message[:presidential_suite] = presidential_suite.to_json
			end
			render json: response_message
    else
      render json: {response: 'Error', message: "Rooms not available"}
    end
  end
end
end
