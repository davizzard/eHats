# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Product.create(name: "Sombrero copa negro de lana", img: "http://www.villagehatshop.com/photos/product/standard/4511390S61126/top-hats/mid-crown-wool-felt-top-hat.jpg", description: "Bonito sombrero de copa alta, de lana y de colores negros y grises.", price: 37.55, stars: 4.8)
p2 = Product.create(name: "Sombrero copa rojo de lana", img: "http://www.villagehatshop.com/photos/product/standard/4511390S61144/top-hats/mid-crown-wool-felt-top-hat.jpg", description: "Bonito sombrero de copa y lana. Color rojizo.", price: 38.55, stars: 4.6)
p3 = Product.create(name: "Sombrero copa alta azul de lana", img: "http://www.villagehatshop.com/photos/product/standard/3509260S398/-/size-7-1-4.jpg", description: "Bonito sombrero de lana y copa muy alta de color azulado.", price: 40.95, stars: 4.6)

p4 = Product.create(name: "Fedora negro de lana", img: "http://www.villagehatshop.com/photos/product/standard/2393460S2252/crushable/blixen-wool-litefelt-fedora-hat.jpg", description: "Sombrero fedora negro de lana con detalle de pluma blanca y negra.", price: 49.55, stars: 4.9)
p5 = Product.create(name: "Fedora marrón de paja", img: "http://www.villagehatshop.com/photos/product/standard/4511390S61606/straw-fedoras/ridley-toyo-straw-trilby-fedora-hat.jpg", description: "Fedora marrón de paja con detalle de pluma.", price: 24.95, stars: 4.8)
p6 = Product.create(name: "Fedora azulado de lana", img: "http://www.villagehatshop.com/photos/product/standard/4511390S91097/alt/91097.jpg", description: "Sombrero fedora tono verdoso de lana con detalle de pluma.", price: 35.55, stars: 4.7)
p7 = Product.create(name: "Fedora safari de algodón", img: "http://www.villagehatshop.com/photos/product/giant/4511390S92936/alt/92936.jpg", description: "Sombrero fedora tipo safari de algodón.", price: 28.95, stars: 4.4)

p8 = Product.create(name: "Sombrero vaquero hoja de palma", img: "http://www.villagehatshop.com/photos/product/giant/4511390S70129/alt/70129.jpg", description: "Sombrero rústico tipo vaquero hecho 100% de hoja de palma.", price: 22.05, stars: 0.0)
p9 = Product.create(name: "Sombrero vaquero caliza", img: "http://www.villagehatshop.com/photos/product/giant/4511390S69751/alt/69751.jpg", description: "Sombrero vaquero de paja de toyo color caliza.", price: 46.89, stars: 5.0)
p10 = Product.create(name: "Sombrero flecha rota vaquero", img: "http://www.villagehatshop.com/photos/product/standard/2393460S13276/western-hats/broken-arrow-wool-felt-western-hat.jpg", description: "Sombrero tipo vaquero modelo flecha rota hecho 100% de lana.", price: 29.95, stars: 4.9)

p11 = Product.create(name: "Fedora safari de cuero", img: "http://www.villagehatshop.com/photos/product/giant/4511390S61249/alt/61249.jpg", description: "Sombrero tipo fedora safari hecho de cuero.", price: 39.95, stars: 4.2)
p12 = Product.create(name: "Sombrero toro vaquero de cuero", img: "http://www.villagehatshop.com/photos/product/giant/2639280S1016/alt/1016.jpg", description: "Sombrero tipo vaquero de cuero modelo toro salvaje.", price: 66.45, stars: 3.8)
p13 = Product.create(name: "Sombrero vaquero oeste de cuero ", img: "http://www.villagehatshop.com/photos/product/giant/4511390S57880/alt/57880.jpg", description: "Sombrero tipo vaquero oeste hecho de cuero.", price: 68.00, stars: 5.0)
p14 = Product.create(name: "Sombrero copa esqueletos y rosas", img: "http://www.villagehatshop.com/photos/product/giant/4511390S169741/alt/169741.jpg", description: "Sombrero de copa 100% cuero. Hecho en EEUU.", price: 189.00, stars: 5.0)

c1 = Category.create(name: "Copa alta", img: "http://www.villagehatshop.com/photos/product/standard/4511390S61126/top-hats/mid-crown-wool-felt-top-hat.jpg", description: "Sombreros de copa alta")
c2 = Category.create(name: "Fedora", img: "http://www.villagehatshop.com/photos/product/standard/2393460S2252/crushable/blixen-wool-litefelt-fedora-hat.jpg", description: "Sombreros tipo fedora")
c3 = Category.create(name: "Vaquero", img: "http://www.villagehatshop.com/photos/product/standard/2393460S13276/western-hats/broken-arrow-wool-felt-western-hat.jpg", description: "Sombreros tipo vaquero")
c4 = Category.create(name: "Cuero", img: "http://www.villagehatshop.com/photos/product/giant/2639280S1016/alt/1016.jpg", description: "Sombreros de cuero")

p1.categories << [c1]
p2.categories << [c1]
p3.categories << [c1]
p14.categories << [c1, c4]

p4.categories << [c2]
p5.categories << [c2]
p6.categories << [c2]
p7.categories << [c2]
p11.categories << [c2, c4]

p8.categories << [c3]
p9.categories << [c3]
p10.categories << [c3]
p12.categories << [c3, c4]
p13.categories << [c3, c4]