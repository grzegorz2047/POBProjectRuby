class Event
	def initialize()
		@eventTypes = ["Animals", "Monsters", "Weapons", "Idle"]
	end
	
	def callEvent()
		rand = Random.rand(@eventTypes.length)	
		@eventTypes[rand]
	end
end