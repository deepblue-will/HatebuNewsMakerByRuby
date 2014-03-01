# encoding: utf-8

require_relative "models/setting"
require_relative "models/template"
require_relative "models/search_option"
require_relative "hatebu_acceeser"

require "date"

user_name = "deepblue_will"
api_key = "vi1jti7dfs"

setting = Setting.new
option = SearchOption.new(setting.policy, "20140224", "20140228")
acceeser = HatebeAccesser.new(user_name)

entries = acceeser.get_atom_feed_entries(option)

template = Template.new("2")
puts template.get_tags(entries)
