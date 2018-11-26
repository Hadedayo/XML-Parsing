require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('xml_menu.xml'))
  end

  def get_menu_names
    @menu.search('name')
  end


end

guiseppes = GuiseppesMenu.new
p guiseppes.menu
puts guiseppes.get_menu_names
