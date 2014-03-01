# encoding: utf-8

require_relative "models/setting"
require_relative "models/template"
require_relative "models/search_option"
require_relative "hatebu_acceeser"
require_relative "option_inputer"

require "date"

FILE_NAME = "hatebu_no_matome" + DateTime.now.strftime("%Y%m%d%H%M%S") + ".txt"
FILE_PATH = File.expand_path("../../target/#{FILE_NAME}", __FILE__)

setting = Setting.new
input_option = OptionInputer.new
option = SearchOption.new(setting.policy, input_option.start_date, input_option.end_date)
acceeser = HatebeAccesser.new(setting.account["user_name"])

entries = acceeser.get_atom_feed_entries(option)

template = Template.new(input_option.format)
tags = template.get_tags(entries)

File.open(FILE_PATH, "w"){|file| file.puts(tags)}
