require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def get_menu_price
    @menu.search('price').text
  end

  def removePoundFromPrice
    get_menu_price.split("£").drop(1)
  end

  def get_xpath_calories
    @menu.xpath('/breakfast_menu/food/calories')
  end




end

guiseppes = GuiseppesMenu.new
# puts guiseppes.get_menu_price
# print guiseppes.removePoundFromPrice
# puts guiseppes.removePoundFromPrice
puts guiseppes.get_xpath_calories
puts guiseppes.get_xpath_calories[0].text.to_i
puts guiseppes.get_xpath_calories[3].text.to_i
