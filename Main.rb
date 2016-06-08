require './Mob'
require './AgressiveMob'
require './Player'
require './Weapon'
require './Event'
require './FileManagement'
require 'io/console'

def time_diff_milli(start, finish)
   (finish - start) * 1000.0
end
hash = Hash.new
turn = 1
puts "Witaj w symulatorze swiata postapokaliptycznego"

saveExists = File.file?('save/save.sav')

puts "Czy chcesz rozpoczac nowa gre? Jezeli tak nacisnij klawisz N"
puts "W przeciwnym razie nacisnij dowolny inny klawisz"
answer = STDIN.getch
if(!saveExists || answer == 'n')
	if(saveExists)
		FileManagement.removeSaves()
	end
	FileManagement.loadFile(hash, 'Monsters.dat', 'Monsters')
	FileManagement.loadFile(hash, 'Weapons.dat', 'Weapons')
	FileManagement.loadFile(hash, 'Animals.dat', 'Animals')
	FileManagement.loadFile(hash, 'Players.dat', 'Players')
else
	hash = FileManagement.loadHash(hash)
	turn = FileManagement.loadTurn(turn)
end



event = Event.new()



keepLoop = true
while keepLoop do
	puts "Tura nr " + turn.to_s
	hash['Players'].each do |p|
		eventType = event.callEvent()
		if eventType == "Idle"
			puts "Gracz " + p.getName() + " odpoczywa"
			next
		end
		randomNumber = hash[eventType].length
		if(randomNumber <= 0)
			puts "Gracz " + p.getName() + " idzie przez pustkowia"
			next
		end
		randomNumber = rand(hash[eventType].length)
		obj = hash[eventType][randomNumber]
		obj.interaction(p)
		if(obj.toDestroy())
			hash[eventType].delete_at(randomNumber)
		end
	end
	hash['Players'].delete_if do |obj|
		if obj.toDestroy()
			true
		else
			false
		end
	end
	if hash['Players'].length == 0
	puts "Symulator zakonczyl swoja prace! Wszyscy gracze zgineli! Rozgrywka trwala " + turn.to_s + " tur/y"
		keepLoop = false
	elsif hash['Monsters'].length == 0
		puts "Symulator zakonczyl swoja prace! Gracz/e zabil/i wszystkie potwory! Rozgrywka trwala " + turn.to_s + " tur/y"
		keepLoop = false
	end
	if turn % 10 == 0
		t1 = Time.now
		puts "Zapisuje stan programu!"
		FileManagement.saveGame(hash, turn)
		t2 = Time.now
		msecs = time_diff_milli t1, t2
		puts "Zapisano stan gry w " + msecs.to_s[0..3] + " milisekund"
	end
	turn += 1
	sleep 2
end