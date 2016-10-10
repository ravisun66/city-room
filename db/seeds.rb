room_types = [
    {
        name: 'Deluxe Rooms', description: 'Queen Size Bed', price_per_night: '7000'
    },
    {
        name: 'Luxury Rooms', description: 'Queen Size Bed and Pool Facing', price_per_night: '8500'
    },
    {
        name: 'Luxury Suites', description: 'King Size Bed and Pool Facing', price_per_night: '12000'
    },
    {
        name: 'Presidential Suites', description: 'King Size Bed, Pool Facing with a Gym', price_per_night: '20000'
    }
]

rooms = [
		{
			number: 'A 01', room_type_id: 1
		},
		{
			number: 'A 02', room_type_id: 1
		},
		{
			number: 'A 03', room_type_id: 1
		},
		{
			number: 'A 04', room_type_id: 1
		},
		{
			number: 'A 05', room_type_id: 1
		},
		{
			number: 'B 01', room_type_id: 1
		},
		{
			number: 'B 02', room_type_id: 1
		},
		{
			number: 'B 03', room_type_id: 1
		},
		{
			number: 'B 04', room_type_id: 1
		},
		{
			number: 'B 05', room_type_id: 1
		},
		{
			number: 'C 01', room_type_id: 1
		},
		{
			number: 'C 02', room_type_id: 1
		},
		{
			number: 'C 03', room_type_id: 1
		},
		{
			number: 'C 04', room_type_id: 1
		},
		{
			number: 'C 05', room_type_id: 1
		},
		{
			number: 'D 01', room_type_id: 1
		},
		{
			number: 'D 02', room_type_id: 1
		},
		{
			number: 'D 03', room_type_id: 1
		},
		{
			number: 'D 04', room_type_id: 1
		},
		{
			number: 'D 05', room_type_id: 1
		},
		{
			number: 'A 06', room_type_id: 2
		},
		{
			number: 'A 07', room_type_id: 2
		},
		{
			number: 'A 08', room_type_id: 2
		},
		{
			number: 'A 09', room_type_id: 2
		},
		{
			number: 'A 10', room_type_id: 2
		},
		{
			number: 'B 06', room_type_id: 2
		},
		{
			number: 'B 07', room_type_id: 2
		},
		{
			number: 'B 08', room_type_id: 2
		},
		{
			number: 'B 09', room_type_id: 2
		},
		{
			number: 'B 10', room_type_id: 2
		},
		{
			number: 'C 06', room_type_id: 2
		},
		{
			number: 'C 07', room_type_id: 2
		},
		{
			number: 'C 08', room_type_id: 2
		},
		{
			number: 'C 09', room_type_id: 2
		},
		{
			number: 'C 10', room_type_id: 2
		},
		{
			number: 'D 06', room_type_id: 2
		},
		{
			number: 'D 07', room_type_id: 2
		},
		{
			number: 'D 08', room_type_id: 2
		},
		{
			number: 'D 09', room_type_id: 2
		},
		{
			number: 'D 10', room_type_id: 2
		},
		{
			number: 'D 11', room_type_id: 3
		},
		{
			number: 'D 12', room_type_id: 3
		},
		{
			number: 'D 13', room_type_id: 3
		},
		{
			number: 'D 14', room_type_id: 3
		},
		{
			number: 'D 15', room_type_id: 3
		},
		{
			number: 'D 16', room_type_id: 3
		},
		{
			number: 'D 17', room_type_id: 3
		},
		{
			number: 'D 18', room_type_id: 3
		},
		{
			number: 'D 19', room_type_id: 3
		},
		{
			number: 'D 20', room_type_id: 3
		},
		{
			number: 'E 01', room_type_id: 3
		},
		{
			number: 'E 02', room_type_id: 3
		},
		{
			number: 'E 03', room_type_id: 4
		},
		{
			number: 'E 04', room_type_id: 4
		},
		{
			number: 'E 05', room_type_id: 4
		},
		{
			number: 'E 06', room_type_id: 4
		},
		{
			number: 'E 07', room_type_id: 4
		},
		{
			number: 'E 08', room_type_id: 4
		},
		{
			number: 'E 09', room_type_id: 4
		},
		{
			number: 'E 10', room_type_id: 4
		}
]

room_types.each do |rt|
    RoomType.create(rt)
end

rooms.each do |r|
    Room.create(r)
end