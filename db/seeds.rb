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
  starts_at: DateTime.parse('2021-01-01T12:20:00+09:00'),
  ends_at: DateTime.parse('2021-01-01T14:20:00+09:00'),
  title: 'sample competition',
  explanation: 'サンプルのコンペです.',
)

assignment1 = Assignment.create!(
  user: user1,
  image: images[0],
  competition: competition1,
)

annotation1 = Annotation.create!(
  image: images[0],
  annotation_label: annotation_label1,
  user: user1,
  assignment: assignment1,
)
