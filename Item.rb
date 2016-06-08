class Item
	def initialize(name)
		@name = name
	end
	def interaction(player)
		puts player.getName() + " wszedl w interakcje z " + @name 
	end
	
end