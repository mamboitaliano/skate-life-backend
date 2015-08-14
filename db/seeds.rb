require 'csv'
require 'geokit'

CSV.foreach('db/skateparks.csv', headers: true, header_converters: :symbol, ) do |row|
  park_params = Hash[row]

  if park_params[:address]
    sleep(0.2)
    lat_long = Geokit::Geocoders::GoogleGeocoder.geocode(park_params[:address]) if park_params[:address]
    lat = lat_long.to_s.match(/Latitude: (.\d+\.\d+)/)[1]
    long = lat_long.to_s.match(/Longitude: (.\d+\.\d+)/)[1]

    if park_params[:name]
      Skatepark.create(
        name: park_params[:name],
        address: park_params[:address],
        lat: lat,
        lon: long)
    else
      Skatepark.create(
        name: park_params[:city],
        address: park_params[:address],
        lat: lat,
        lon: long)
    end
  end

end




# require 'nokogiri'

# @doc = Nokogiri::XML(File.open('db/skateparks.kml'))

# @doc.css('Placemark').each do |placemark|
#   name = placemark.css('name')
#   coordinates = placemark.at_css('coordinates')
#   address_reg_exp = placemark.at_css('description').to_s.match(/(\d+\ \w+\ \w+)<br>(\w+, \w+\ \d+)/)

#   address = $1 + $2 if address_reg_exp
#   # p address

#   if name && coordinates
#     # print name.text + ","
#     coordinates.text.split(' ').each do |coordinate|
#       (lon,lat,elevation) = coordinate.split(',')
#       Skatepark.create(
#         name: name.text,
#         address: address,
#         lat: lat,
#         lon: lon)
#     end
#   end
# end


# # LOCAL SEED
# CSV.foreach('db/skateparks.csv', headers: true, header_converters: :symbol, ) do |row|
#   park_params = Hash[row]
# >>>>>>> 8103494f378a8f6d43525a1ebe0b1e2146edd9b0

  
#   if park_params[:name]
#     Skatepark.create(
#       name: park_params[:name],
#       address: park_params[:address])
#   else
#     Skatepark.create(
#       name: park_params[:city],
#       address: park_params[:address])  
#   end

# end