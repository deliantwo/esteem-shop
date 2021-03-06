# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_ppg(gameval, platformval, priceval)
    ppg = PricePlatformGame.create(price: priceval, platform: platformval, game: gameval)
    return ppg
end

def create_keys(ppg, n)
    n.times do
        key = (0...12).map { (65 + rand(26)).chr }.join
        Gamekey.create(content: key, price_platform_game: ppg)
    end
end

Publisher.create(name: "Iceberg Interactive")
Publisher.create(name: "Rockstar Games")
Publisher.create(name: "Ndemic Creations")
Publisher.create(name: "11 bit studios")
Publisher.create(name: "Electronic Arts")
Publisher.create(name: "inXile Entertainment")
Publisher.create(name: "Ubisoft")

Producer.create(name: "Ndemic Creations")   
Producer.create(name: "Maxis")   
Producer.create(name: "Rockstar Games")
Producer.create(name: "Sun Games Interactive")
Producer.create(name: "11 bit studios")
Producer.create(name: "inXile Entertainment")
Producer.create(name: "Ubisoft")

Category.create(name: "RTS") 
Category.create(name: "RPG") 
Category.create(name: "Akcji") 
Category.create(name: "Symulatory") 

steam = Platform.create(name: "Steam")  
origin = Platform.create(name: "Origin")  

plague = Game.create(name: "Plague Inc: Evolved", description: "Plague Inc: Evolved jest unikalną mieszanką zaawansowanej strategii i przeraźliwie realistyczną symulacją.", category: Category.find_by(name: "RTS"), publisher: Publisher.find_by(name: "Ndemic Creations"), producer: Producer.find_by(name: "Sun Games Interactive"))
gta = Game.create(name: "Grand Theft Auto V", description: "Gdy młody opryszek, emerytowany rabuś i przerażający psychol wplątują się w gangsterskie porachunki i interesy świata zbrodni, rządu USA i przemysłu rozrywkowego, muszą wykonać serię niebezpiecznych napadów, aby przetrwać w bezlitosnym świecie, w którym zdrada czyha na każdym kroku.", category: Category.find_by(name: "Akcji"), publisher: Publisher.find_by(name: "Rockstar Games"), producer: Producer.find_by(name: "Rockstar Games"))
twm = Game.create(name: "This War of Mine", description: "W XXI wieku tylko jedno jest pewne. Wojna może wybuchnąć wszędzie i w każdej chwili. A jeśli twoje miasto zostanie oblężone, wiedz, że nie jesteś na to przygotowany.", category: Category.find_by(name: "Symulatory"), publisher: Publisher.find_by(name: "11 bit studios"), producer: Producer.find_by(name: "11 bit studios"))
sims = Game.create(name: "The Sims 4", description: "Gra The Sims™ powraca po pięciu latach!  Gra The Sims™ 4 to wyjątkowa symulacja życia, w której będziesz mógł pogrywać życiem Simów i tworzyć szalone historie. Czwarta odsłona najlepiej sprzedającej się serii na komputery PC zostanie wydana w polskiej wersji językowej komputery PC.", category: Category.find_by(name: "Symulatory"), publisher: Publisher.find_by(name: "Electronic Arts"), producer: Producer.find_by(name: "Maxis"))
wasteland = Game.create(name: "Wasteland 2", description: "Wasteland 2 to bezpośrednia kontynuacja gry z 1988 roku, pierwszego w historii postapokaliptycznego RPG, który był inspiracją dla serii Fallout. Żadna inna komputerowa gra fabularna nie dawała wcześniej graczom kontroli nad poszczególnymi członkami drużyny aby zaplanować taktykę starcia, ani możliwości dokonywania moralnych wyborów, które wpływały na świat wokół nich. Wasteland było też innowacyjne pod względem możliwości rozwiązywania fabularnych problemów na wiele sposobów, umożliwiając graczom przechodzenie gry w najodpowiedniejszym dla nich stylu.", category: Category.find_by(name: "RPG"), publisher: Publisher.find_by(name: "inXile Entertainment"), producer: Producer.find_by(name: "inXile Entertainment"))
acu = Game.create(name: "Assassin’s Creed: Unity", description: "Paryż, rok 1789. Rewolucja zamienia to wspaniałe miasto w gniazdo terroru i chaosu. Brukowane ulice spływają krwią mieszczan, którzy stawili opór arystokracji. W czasie, gdy naród rozrywa się na strzępy, młody człowiek imieniem Arno wyrusza w niezwykłą podróż, która ujawni prawdziwe siły stojące za rewolucją. Jego poszukiwania doprowadzą go do jądra zmagań o przyszłość kraju i uczynią go Mistrzem Asasynów. Przedstawiamy Assassin’s Creed® Unity, next-genowa ewolucja flagowego tytułu zasilanego mocą nowego silnika Anvil. Od zdobycia Bastyli po ścięcie Ludwika XVI, doświadczysz rewolucji francuskiej jak nigdy dotąd i pomożesz ludowi Francji stworzyć nową przyszłość. ", category: Category.find_by(name: "Akcji"), publisher: Publisher.find_by(name: "Ubisoft"), producer: Producer.find_by(name: "Ubisoft"))

PricePlatformGame.create(price: 70, platform: Platform.find_by(name: "Steam"), game: Game.find_by(name: "Plague Inc: Evolved"))
PricePlatformGame.create(price: 80, platform: Platform.find_by(name: "Origin"), game: Game.find_by(name: "Plague Inc: Evolved"))

create_keys(create_ppg(gta, steam, 200), 3)
create_keys(create_ppg(twm, steam, 120), 1)
create_keys(create_ppg(sims, origin, 220), 4)
create_keys(create_ppg(wasteland, steam, 160), 3)
create_keys(create_ppg(acu, steam, 180), 14)

Gamekey.create(content: "XXXXXXXXXXX1", price_platform_game: PricePlatformGame.find_by(game: Game.find_by(name: "Plague Inc: Evolved"), platform: Platform.find_by(name: "Steam")))
Gamekey.create(content: "XXXXXXXXXXX2", price_platform_game: PricePlatformGame.find_by(game: Game.find_by(name: "Plague Inc: Evolved"), platform: Platform.find_by(name: "Steam")))

vat_23 = Vat.create(value: 23)

test_user = User.new
test_user.email = 'admin@admin.pl'
test_user.password = '123456789'
test_user.password_confirmation = '123456789'
test_user.is_admin = true
test_user.skip_confirmation!
test_user.save!

test_user = User.new
test_user.email = 'user@user.pl'
test_user.password = '123456789'
test_user.password_confirmation = '123456789'
test_user.skip_confirmation!
test_user.save!

tu_game_key = Gamekey.create(user: test_user, content: "XXXXXXXXXXX3", price_platform_game: PricePlatformGame.find_by(game: Game.find_by(name: "Plague Inc: Evolved"), platform: Platform.find_by(name: "Steam")))
test_purchase = Purchase.create(status: 1, user: test_user)
SoldProduct.create(gamekey: tu_game_key, vat: vat_23, price: 99.36, purchase: test_purchase) 
