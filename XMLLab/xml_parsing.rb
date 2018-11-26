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


end

guiseppes = GuiseppesMenu.new
puts guiseppes.get_menu_price
print guiseppes.removePoundFromPrice
puts guiseppes.removePoundFromPrice
