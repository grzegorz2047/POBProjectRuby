require './AgressiveMob'

class Player < AgressiveMob
		def initialize(name, health, maxHealth, attackPoints)
			super(name, health, attackPoints)
			@maxHealth = maxHealth
		end
		
		def getMaxHealth()
			@maxHealth
		end
end