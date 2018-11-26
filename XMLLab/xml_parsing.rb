require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def get_menu_price
    @menu.search('price').text
  end

  def split_£FromPrice
    get_menu_price.split('£')
  end


end

guiseppes = GuiseppesMenu.new
puts guiseppes.get_menu_price
puts guiseppes.split_£FromPrice
