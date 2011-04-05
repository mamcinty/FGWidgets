require 'open-uri'
    
class FundraiserInquiry
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Serialization
  include ActiveModel::Serializers::JSON
  include ActiveModel::Serializers::Xml
  extend ActiveModel::Naming
  
  attr_accessor :name, :percent, :goal, :raised, :time
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    
    @attributes = attributes
  end
  
  def attributes
    @attributes
  end
  
  def name
    @name
  end
  
  def percent
    @percent
  end
  
  def goal
    @goal
  end
  
  def raised
    @raised
  end
  
  def time
    @time
  end
  
  def self.find_by_profile_name_and_fundraiser_name(profile_name, fundraiser_name)
    url = "http://www.firstgiving.com/fundraiser/#{profile_name}/#{fundraiser_name}"
    
    self.find_by_url(url)
  end

  def self.find_by_url(url)
    begin
      page = open(url)
    rescue
      return nil
    end
    
    doc = Nokogiri::HTML(page)
    
    name = doc.at_css(".eventname").text.strip

    percent = doc.at_css("#percent").attr('value')

    doc.at_css(".goal").at_css("div").remove
    goal = doc.at_css(".goal").text.strip

    doc.at_css(".raised").at_css("div").remove
    raised = doc.at_css(".raised").text.strip

    time = doc.search("#appealResult header hgroup time").text.strip
    
    self.new({'name' => name, 'percent' => percent, 'goal' => goal, 'raised' => raised, 'time' => time})
  end
  
  def persisted?
    false
  end
end