# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"


CSV.foreach('db/csv/emotions.csv') do |row|
  Emotion.create(:name => row[1])
end

CSV.foreach('db/csv/dimensions.csv') do |row|
  Dimension.create(:project_id => row[1], :name => row[2])
end

CSV.foreach('db/csv/emo_blocks.csv') do |row|
  EmoBlock.create(:project_id => row[1], :dimension_id => row[2], :started_at => row[3], :ended_at => row[4])
end

CSV.foreach('db/csv/emo_records.csv') do |row|
  EmoRecord.create(:emo_block_id => row[1], :emotion_id => row[2], :value => row[3])
end

EmoTip.create(name: "平均値")
EmoTip.create(name: "最大値")
EmoTip.create(name: "最小値")

# Authority.create(name: 'Admin')
# Authority.create(name: 'Write')
# Authority.create(name: 'Read')

