require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu, :array_calories, :greater_than_1000calories_array

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
    @calories = @menu.search('calories')
    @array_calories = []
    @greater_than_1000calories_array = []
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
      @array_calories.delete(1200)
    end
    array_calories
  end

  def get_xpath_food_description
    @menu.xpath('////description')
  end

  def search_description
    array_description = []
    get_xpath_food_description.each do |v|
      array_description << v.text
    end
    array_description
  end

  def waffles
    array_waffles = []
    search_description.each do |w|
      if w.include?"waffles"
        array_waffles << w
      end
      array_waffles
    end
    array_waffles
  end


end

guiseppes = GuiseppesMenu.new
# puts guiseppes.get_menu_price
# print guiseppes.removePoundFromPrice
# puts guiseppes.removePoundFromPrice
# puts guiseppes.get_xpath_calories
# puts guiseppes.get_xpath_calories[0].text.to_i
# puts guiseppes.get_xpath_calories[3].text.to_i
# print guiseppes.calories_array
# print guiseppes.search_description
puts guiseppes.waffles
