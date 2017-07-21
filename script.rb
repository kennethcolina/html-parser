require 'nokogiri'

class Player
	def initialize(node)
		@birthdate = node.text().strip
	end

	def to_s
		"#{@birthdate}"
	end
end

# ler arquivo do campeonato
campeonato = "sub20_2015.txt"
arquivo = File.open("#{campeonato}")

# array de paises participantes
paises = ["brasil.html", "gana.html", "mali.html", "nigeria.html", "senegal.html", "coreianorte.html", "myanmar.html", "catar.html", "uzbequistao.html", "austria.html", "alemanha.html", "hungria.html", "portugal.html", "servia.html", "ucrania.html", "honduras.html", "mexico.html", "panama.html", "usa.html", "fiji.html", "novazelandia.html", "argentina.html", "colombia.html", "uruguai.html"]

for i in 0...paises.size
	id_player = 1
	doc = Nokogiri::HTML(File.open(paises[i]))
	puts doc.xpath('//*[@id="content-wrap"]/div/div[2]/div/div[1]/div[2]/h1/text()').first

	doc.xpath('//div[@class="p p-i-no"]/div[@class="p-ag age"]/span[@class="data"]').each do |node|
		print "#{id_player} "
		puts Player.new(node)
		id_player = id_player + 1
	end
	puts
end

