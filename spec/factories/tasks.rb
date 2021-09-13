FactoryBot.define do
  factory :task do
    name {'title'}
    content {'content'}
    expiry_date {DateTime.now +1.day}
    status {"unstarted"}
    priority {"Low"}
    user_id {nil}
  end
  factory :second_task, class: Task do
    name {'title2'}
    content {'content2'}
    expiry_date {DateTime.now +2.day}
    status {"progress"}
    priority {"High"}
    user_id {nil}

  end
 
end
