#! /usr/bin/env ruby

require File.expand_path('../../../config/environment', __FILE__) # rubocop: disable ExpandPathArguments, LineLength
require 'mechanize'
require 'pry'

# http://aa.usno.navy.mil/data/docs/MoonPhase.php
USNO_API_BASE = 'http://api.usno.navy.mil/moon/phase'.freeze

def url_params(yyyy)
  {
    id: 'howlingdog',
    year: yyyy.to_s
  }.to_query
end

def scrape(page)
  phase_data = JSON.parse(page.body)['phasedata']
  success_count = 0
  phase_data.each do |phase|
    the_time = Time.parse("#{phase['time']} UTC")
    not_found = MoonPhase.where(date: phase['date'], time: the_time).blank?

    if not_found
      phase[:date_raw] = phase['date']
      phase[:time_raw] = phase['time']
      phase['time'] = the_time
      MoonPhase.create!(phase)
      success_count += 1
    end
  end

  success_count
end

# MAIN
agent = Mechanize.new

params = url_params('2013')

puts "--> #{USNO_API_BASE}?#{params}"
puts "\nAttempt to download data from aa.usno.navy.mil\n"

page = agent.get("#{USNO_API_BASE}?#{params}")

result = scrape(page)

puts "SUCCESS: #{result} records created"
