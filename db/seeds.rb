require 'date'

user1 = User.create!(
  name: 'J.S. Bach',
  email: 'bach@example.com',
  password: 'password',
)

image_class1 = ImageClass.create!(
  synset: 'n0001',
  name: 'image_class1',
)


# 画像を作成
images = []
20.times do
  image = Image.create!(
    url: 'https://example.com/example.png',
    image_class: image_class1,
  )
  images.push(image)
end

annotation_label1 = AnnotationLabel.create!(
  explanation: 'noise'
)

competition1 = Competition.create!(
  starts_at: DateTime.parse('2030-01-01T12:20:00+09:00'),
  ends_at: DateTime.parse('2030-01-01T14:20:00+09:00'),
  title: 'sample competition',
  explanation: 'サンプルのコンペです.',
)

assignments = []
10.times do |i|
  assignment = Assignment.create!(
    image: images[0],
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
