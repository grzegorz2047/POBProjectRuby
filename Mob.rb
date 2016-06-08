require './Attackable'
class Mob
	include Attackable
	def initialize(name, health)
		@health = health
		@name = name
		@toDestroy = false
	end	
	def getName()
		@name
	end
	def toDestroy()
		@toDestroy
	end
	def setToDestroy(value)
		@toDestroy = value
	end
	def getHealth()
		@health
	end
	def isKilled()
		@health <= 0
	end
	def interaction(player)
		puts @name + " wszedl w interakcje z " + player.getName()
	end
end