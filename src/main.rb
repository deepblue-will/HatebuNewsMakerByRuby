# coding: UTF-8

require "./models/account"
#require "./models/template"

RESOURSES_PATH = "../resources/"

account = Account.new(RESOURSES_PATH)

puts account.id
puts account.password

template = Template.new(RESOURSES_PATH, 3)
puts template.outer_start
puts template.outer_end
puts template.inner
