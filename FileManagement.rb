require './AgressiveMob'
require './Animal'

module FileManagement

	def self.loadFile(hash, filename, type)
		array = Array.new
		File.foreach(filename) {
			|x| array.push(eval(x))
		}
		hash.store(type, array)
	end

	def self.saveGame(hash, turn)
		File.open('save/save.sav', 'w') {|f| f.write(Marshal.dump(hash)) }
		File.open('save/savedTurn.sav', 'w') {|f| f.write(Marshal.dump(turn)) }
	end
	def self.loadTurn(turn)
		turn = Marshal.load(File.read('save/savedTurn.sav'))
		puts "Wczytano numer tury!"
		turn
	end
	def self.loadHash(hash)
		hash = Marshal.load(File.read('save/save.sav'))
		puts "Wczytano rozgrywke!"
		hash
	end
	def self.removeSaves()
		File.delete('save/savedTurn.sav')
		File.delete('save/save.sav')
	end
end