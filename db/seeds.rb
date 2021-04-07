require 'date'
require 'tqdm'

user1 = User.create!(
  name: 'J.S. Bach',
  email: 'bach@example.com',
  password: 'password',
)

image_classes = {} 
["n13133613", "n15075141"].each do |synset|
  image_classes[synset] = ImageClass.create!(
    synset: synset,
    name: synset,
  )
end

# 画像を作成
puts 'making images...'
images = []
File.open('db/ILSVRC2012_train_last_2_classes.list') { |f|
  f.tqdm.each_line do |line|
    synset, url = line.chomp.split(',')

    image = Image.create!(
      url: url,
      image_class: image_classes[synset],
    )
    images.push(image)
  end
}

annotation_label1 = AnnotationLabel.create!(
  explanation: 'noise'
)

competition1 = Competition.create!(
  starts_at: DateTime.parse('2000-01-01T12:20:00+09:00'),
  ends_at: DateTime.parse('2030-01-01T14:20:00+09:00'),
  title: 'sample competition',
  explanation: 'サンプルのコンペです.',
)

puts 'making assignments...'
assignments = []
images.tqdm.each do |image|
  assignment = Assignment.create!(
    image: image,
    competition: competition1,
  )
  assignments.push(assignment)
end

assignments[0].user = user1
assignments[0].save!

annotation1 = Annotation.create!(
  annotation_label: annotation_label1,
  user: user1,
  assignment: assignments[0],
)
