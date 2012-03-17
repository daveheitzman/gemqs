require File.dirname( __FILE__ )+"/gemqs/version"  
require 'mechanize'
require 'nokogiri'
require 'open-uri'
require 'yaml'

module Gemqs
  CONFIGURATION_FILE= File.dirname(__FILE__) + "/../config/config.yml" 
  def conf
      if !@conf then
        f=File.open CONFIGURATION_FILE
        @conf = YAML::load( f )
        @conf[:query]=''
        @conf
      else 
        @conf
      end 
  end 

  class Scraper
    def initialize
      puts "gem quicksearch -- using url: " + conf["urls"]["rubygems"]
      case ARGV.size
      when 0 
        puts "usage: gemqs [search terms] "
      else
        query=ARGV.join("+")
   #     query = "/search?utf8=\u2713&query="+query
        query = "/search?query="+query
        conf[:query] = query
      end 
      
      puts "url to be sent as a search "+conf['urls']['rubygems']+conf[:query]
    end 
    def agent
      @agent=Mechanize.new
    end 
    def html_page
      @html_page ||= Nokogiri::HTML( open( conf['urls']['rubygems']+conf[:query] ) )
      #~ @html_page = Nokogiri::HTML( open('http://www.handsonnetwork.org/actioncenters/handsonconnect') )
    end 
    def get_page
      if conf[:query].size > 0
        rpage=html_page #agent.get conf['urls']['rubygems']+conf[:query]
        #~ puts rpage.inspect 
  #      rpage.links.each do |l| puts l.text if l.text.include? "\n" end 
         #~ rpage.links.each do |l| puts l.inspect end 
        ritems = rpage.css('div.gems.border>ol>li')
        ritems.each do |rli| 
          #~ puts "num of chidlren "+rli.children.size.to_s
          rli.children.each_with_index do |item,index|
   #         puts index.to_s + ": " + item.text
            #puts item.to_s.split("\n").inspect 
          end 
  #        gem_name_and_version=rli.children[3].css("strong").text.to_s
          #puts txt.first + txt.last + rli[0].to_s.split[0].to_s
          puts rli.children[1].text.to_s  + rli.children[3].text.split("\n")[1]+rli.children[3].text.split("\n")[2]
          #~ puts "gem_name_and_version "+gem_name_and_version
          #~ puts rli.children[3].text.split("\n").inspect
        end 
      end 
    end 
  end 
  
  class Organizer
  end 
  #Mechanize.new  

  # Your code goes here...
end
