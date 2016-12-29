require 'csv'

 comments_csv = File.read(Rails.root.join('lib', 'seeds', 'comments.csv'))
 comments = CSV.parse(comments_csv, headers: true, encoding: 'iso-8859-1:UTF-8')
 comments.each do |row|
   comment = Comment.new
   comment.text = row["text"]
   comment.sandwich_id = row["sandwich_id"]
   comment.eater_id = row["eater_id"]
   comment.save
 end
 #
 # eater_sandwiches_csv = File.read(Rails.root.join('lib', 'seeds', 'eater_sandwiches.csv'))
 # eater_sandwiches = CSV.parse(eater_sandwiches_csv, headers: true, encoding: 'iso-8859-1:UTF-8')
 # eater_sandwiches.each do |row|
 #   es = EaterSandwich.new
 #   es.sandwich_id = row['sandwich_id']
 #   es.eater_id = row['eater_id']
 #   es.save
 # end

 # eaters_csv = File.read(Rails.root.join('lib', 'seeds', 'eaters.csv'))
 # eaters = CSV.parse(eaters_csv, headers: true, encoding: 'iso-8859-1:UTF-8')
 # eaters.each do |row|
 #   eater = Eater.new
 #   eater.name = row['name']
 #   eater.save
 # end

 # sandwiches_csv = File.read(Rails.root.join('lib', 'seeds', 'sandwiches.csv'))
 # sandwiches = CSV.parse(sandwiches_csv, headers: true, encoding: 'iso-8859-1:UTF-8')
 # sandwiches.each do |row|
 #   sandwich = Sandwich.new
 #   sandwich.ingredients = row['ingredients']
 #   sandwich.date = Date.strptime(row['date'], '%m/%d/%Y')
 #   sandwich.location = row['location']
 #   sandwich.price = row['price']
 #   sandwich.tasting_notes = row['tasting_notes']
 #   sandwich.save
 # end
