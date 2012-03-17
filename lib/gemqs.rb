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
    attr_accessor :results
    def initialize
      #~ puts "  gemqs (gem quick-search) "
      #~ puts "    by David Heitzman, 2012. http://aptifuge.com"
      #~ puts 
      case ARGV.size
      when 0 
        puts "usage: gemqs [search terms] "
      else
        print "gemqs "
        query=ARGV.join("+")
        conf[:terms] = query.split "+"
        query = "/search?query="+query
        conf[:query] = query
      end 
      @results = []
    end 
    def agent
      @agent=Mechanize.new
    end 
    def html_page
      @html_page ||= Nokogiri::HTML( open( conf['urls']['rubygems']+conf[:query] ) )
    end 

    def get_page
      if conf[:query].size > 0
        puts "  searching #{conf['urls'].map{|k,v| v }.join(', ')} on the terms: "+conf[:terms].join( " " )
        rpage=html_page
        ritems = rpage.css('div.gems.border>ol>li')
        ritems.each do |rli| 
          self.results << [
            rli.children[1].text.split(" ").first.gsub(",","").to_i,
            rli.children[3].text.split("\n")[1],
            rli.children[3].text.split("\n")[2], 
            rli.children[1].text.split(" ").first
            ]
        end 
        results.sort{|a,b| b.first <=> a.first}.each do |i|
          printf("%-40.40s %14.14s downloads #{ i[2] }\n",i[1],i[3])
        end 
      end 
    end 
  end 
  
  class Organizer
  end 

  # Your code goes here...
end
