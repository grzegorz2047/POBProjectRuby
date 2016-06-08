require './Mob'

class AgressiveMob < Mob
	def initialize(name, health, attackPoints)
		super(name, health)
		@attackPoints = attackPoints
	end	
	def getAttackPoints()
		@attackPoints
	end
	def setAttackPoints(attackPoints)
		@attackPoints = attackPoints
	end
	def getHealth()
		@health
	end
	def interaction(player)
		mobAttacks = (@health/player.getAttackPoints).to_i
		playerAttacks = (player.getHealth/@attackPoints).to_i
		newHealth = player.getHealth() -(mobAttacks * @attackPoints);
		if(newHealth <= 0)
			player.setToDestroy(true)
			puts "Gracz " + player.getName() + " zginal przez " + @name + " w " + mobAttacks.to_s + " atakach"
		else
			@toDestroy = true
			player.changeHealth(-(mobAttacks * @attackPoints))
			if(mobAttacks == 0)
				playerAttacks = 1
			end
			puts "Gracz " + player.getName() + " zabil " + @name + " w " + playerAttacks.to_s  + " atak/u/ach"
			puts "Gracz " + player.getName() + " ma teraz " + player.getHealth().to_s + " / " + player.getMaxHealth().to_s
		end		
	end
end