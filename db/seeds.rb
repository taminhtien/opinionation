# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
	'Is Ruby better than Python?',
	'Should abortion be legal?',
	'Should gay marriage be legal?',
	'Are fat people lazy?',
	'Is SASS better than LESS?',
	'Is ReactJS better than AngularJS?'
].each do |content|
	Topic.where(content: content).first_or_create!
end