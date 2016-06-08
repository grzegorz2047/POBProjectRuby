require './Item'
class Weapon < Item

	def initialize(name, attackPoints)
		super(name)
		@attackPoints = attackPoints
		@toDestroy = false
	end
	def toDestroy()
		@toDestroy
	end
	def setToDestroy(value)
		@toDestroy = value
	end
	def getAttackPoints()
		@attackPoints
	end
	def getName()
		@name
	end
	def interaction(p)
		if p.getAttackPoints() < @attackPoints
			p.setAttackPoints(@attackPoints)
			answer = true	
			puts
			answer
		end
		if answer
			print "Gracz " + p.getName() +  " podniosl " + @name + " i go zabral"
			@toDestroy = true
		else
			print "Gracz " + p.getName() + " znalazl " + @name +  " i go zostawil"
		end
		puts
	end
end