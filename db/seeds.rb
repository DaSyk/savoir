Place.create()

Country.create(name: 'Frankreich', place_id: 1)
Country.create(name: 'Italien', place_id: 1)
Country.create(name: 'Spanien', place_id: 1)

Region.create(name: 'Provence-Alpes-Côte d’Azur', country_id: 1)
Region.create(name: 'Midi-Pyrenäen', country_id: 1)

Region.create(name: 'Lombardei', country_id: 2)

Region.create(name: 'Andalusien', country_id: 3)

Location.create(name:'Ort1', region_id: 1)
Location.create(name:'Ort2', region_id: 2)
Location.create(name:'Ort3', region_id: 3)
Location.create(name:'Ort4', region_id: 4)

PageConfig.create()

Page.create(title: 'Startseite', page_config_id: 1, content: '')
Page.create(title: 'Impressum', page_config_id: 1, content: '')
Page.create(title: 'Buchungshinweise', page_config_id: 1, content: '')

Admin.create!(:name => 'root', :email => 'example@example.com', :password => 'rootroot', :password_confirmation => 'rootroot')
