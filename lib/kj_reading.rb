#!/usr/bin/env ruby

# file: kj_reading.rb

require 'kj'


class KjReading

  def self.text(s)

    bible = Kj::Bible.new

    s.strip.lines.map do |line|
            
      r = line.match(/(?<book>\w+)\s+(?<chapter>\d+)[,\:]?\s*(?<verses>.*)/)
      verses = r[:verses] =~ /(?:\.\.|,|-)/ ? Range.new(*r[:verses]\
                          .split(/(?:\.\.|,|-)/).map(&:to_i)).to_a : r[:verses]
      
      "\n" +  bible.books(r[:book])[0].chapter(r[:chapter])\
          .verses(verses).join(' ') + "\n" + line + "\n"

    end.join

  end
  
  def self.abbrev(s)
    
    Kj::Bible.new.books(s)[0].abbreviations
    
  end
  
  def self.books()
    
    h = Kj::Bible.new.books.inject({}) do |r,x|
      r.merge(x.name.downcase => x.abbreviations.split(','))
    end
    
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

