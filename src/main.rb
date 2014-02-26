# encoding: utf-8

require_relative "models/setting"
require_relative "models/template"
require_relative "hatebu_acceeser"

user_name = ""
api_key = ""

acceeser = HatebeAccesser.new({"user_name" => user_name, "api_key" => api_key})

atom_feed = acceeser.get_atom_feed

puts atom_feed.entries[0].link.href
puts atom_feed.entries[0].title.content
# tag
puts atom_feed.entries[0].dc_subjects[0].content
# comment
puts atom_feed.entries[0].summary.content

puts response.body
