class Animal < Mob
	def initialize(name, healthIncreaseValue)
		super(name, healthIncreaseValue)
		@healthIncreaseValue = healthIncreaseValue
	end	
	def interaction(player)
		if(player.getHealth() < player.getMaxHealth())
			diffHealth = player.getMaxHealth() - player.getHealth()
			if(diffHealth < @healthIncreaseValue)
				player.setHealth(player.getMaxHealth())
			else
				player.changeHealth(@healthIncreaseValue)
			end
			@toDestroy = true
			puts player.getName() + " zabil " + @name + " i ma teraz  " + player.getHealth().to_s + " punktow zdrowia"
		end		
	end
end