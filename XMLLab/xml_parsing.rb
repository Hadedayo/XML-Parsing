require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu, :array_calories

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
    @calories = @menu.search('calories')
    @array_calories = []
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


  def calories_array
    get_xpath_calories.each do |value|
      @array_calories << value.text.to_i
    end
    array_calories
  end




end

guiseppes = GuiseppesMenu.new
# puts guiseppes.get_menu_price
# print guiseppes.removePoundFromPrice
# puts guiseppes.removePoundFromPrice
# puts guiseppes.get_xpath_calories
# puts guiseppes.get_xpath_calories[0].text.to_i
# puts guiseppes.get_xpath_calories[3].text.to_i
print guiseppes.calories_array
