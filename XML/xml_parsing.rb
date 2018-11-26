require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('xml_menu.xml'))
  end

  def get_menu_names
    @menu.search('name')
  end

  def get_menu_items
    @menu.search('food')
  end

  def get_xpath_calories
    @menu.xpath('/breakfast_menu/food/calories')
  end







end

guiseppes = GuiseppesMenu.new
# p guiseppes.menu
# puts guiseppes.get_menu_names.last
#
# puts guiseppes.get_menu_names.last
# puts guiseppes.get_menu_names
# puts guiseppes.get_menu_names.length
# puts guiseppes.get_menu_names.last.text
puts guiseppes.get_xpath_calories
