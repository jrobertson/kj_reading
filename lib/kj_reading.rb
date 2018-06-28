#!/usr/bin/env ruby

# file: kj_reading.rb

require 'kj'


class KjReading

  def self.text(s)

    bible = Kj::Bible.new

    r = s.match(/(?<book>\w+)\s+(?<chapter>\d+),\s*(?<verses>.*)/)
    verses = r[:verses] =~ /\.\./ ? \
      Range.new(*r[:verses].split(/\.\./).map(&:to_i)).to_a : r[:verses]
    bible.books(r[:book])[0].chapter(r[:chapter]).verses(verses).join(' ')

  end

  def self.check(s)
    Kj::Bible.new.books(s)[0].name
  end

end


if __FILE__ == $0 then

  # e.g. KjReading.text 'mt 16, 18'
  # e.g. KjReading.text '1co 1, 22..29'  

  KjReading.text ARGV.first

end

