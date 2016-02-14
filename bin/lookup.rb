#!/usr/bin/env ruby

require 'fileutils'
require 'json'
require 'nokogiri'
require 'open-uri'
require 'tmpdir'

extract = File.join(File.expand_path(File.dirname(__FILE__)), 'swfextract')

raise 'failed to find swfextract' unless File.exist?(extract)

raise 'a word is required' if ARGV.length < 1

uri = "http://folkets-lexikon.csc.kth.se/folkets/service?word=#{ARGV[0]}"

page = Nokogiri::HTML(open(uri).read)

elements = page.css('a[href*=swf]')

raise 'failed to find the word' if elements.empty?

uri = elements[0].attributes['href']

raise 'failed to detect the name' unless /(\w+)\.swf/ =~ uri

name = $1

swf = File.join(Dir.tmpdir, "#{name}.swf")
mp3 = File.join(Dir.tmpdir, "#{name}.mp3")

open(uri) do |remote|
  open(swf, 'w') do |local|
    local.write(remote.read)
  end
end

`#{extract} --mp3 --output #{mp3} #{swf}`

File.delete(swf)

puts mp3
