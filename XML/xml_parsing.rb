require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('xml_menu.xml'))
  end




end

guiseppes = GuiseppesMenu.new
p guiseppes.menu
