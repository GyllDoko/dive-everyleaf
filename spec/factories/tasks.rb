FactoryBot.define do
  factory :task do
    name {'title'}
    content {'content'}
  end
  factory :second_task, class: Task do
    name {'title2'}
    content {'content2'}
  end
end
