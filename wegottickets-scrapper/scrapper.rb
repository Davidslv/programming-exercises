#!/usr/bin/env ruby
require 'nokogiri'
require 'restclient'
require 'json'
require 'pry'

class Scrapper

  attr_reader :page_number, :page, :acts, :listing_outers
  MAX_NUMBER_PAGES = 20

  def initialize
    @page_number  = 1
    @acts   = []
    @outers = 10

    process_page
    process_outers
  end

  def process_page
    current_page = "http://www.wegottickets.com/searchresults/page/#{@page_number}/all"
    @page = Nokogiri::HTML(RestClient.get(current_page))

    ticket_listing   =  @page.css('.TicketListing')
    @listing_outers  = ticket_listing.css('.ListingOuter')
  end

  def process_outers
    p "Processing outers... (#{@page_number}/#{MAX_NUMBER_PAGES})"

    listing_outers.each do |outer|
      @outers -= 1
      next_page if @outers == 0
      next if outer.css('.ListingAct h3').text =~ /comedy/i
      act = {}
      act[:name]  = outer.css('.ListingAct h3').text
      act[:href]  = outer.css('.ListingAct h3 a')[0]['href']
      act[:city]  = outer.css('.ListingAct blockquote .venuetown').text
      act[:venue] = outer.css('.ListingAct blockquote .venuename').text

      avoids_catched_text(outer)

      act[:date] = outer.css('.ListingAct blockquote p').text

      acts << act
    end
  end

  def next_page
    to_json if @page_number == MAX_NUMBER_PAGES
    @outers      = 10
    @page_number += 1

    process_page
    process_outers
  end

  def to_json
    puts @acts.to_json
    exit 0
  end

  private

  def avoids_catched_text(outer)
    2.times { outer.css('.ListingAct blockquote p span')[0].unlink }
    outer.css('.ListingAct blockquote p i').unlink
  end

end

Scrapper.new.to_json
