require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Task model test' do
    context 'Si le Title la tâche est vide' do
      it "C'est difficile à Validation" do
        task = Task.new(name: '', content: '失敗test')
        expect(task).not_to be_valid
      end
    end
  end
  describe "fonction de validation taches vides" do
    context 'Si les détails de la tâche sont vides' do
      it 'Validation est intercepté' do
          # Écrivez du contenu ici
      @task = Task.new( name: 'task1',content: nil, expiry_date:DateTime.now,status:0,priority:1)
      expect(@task).not_to be_valid

      end
    end
  end
    
  describe "fonction de validation des taches décrites" do
    context 'Si le Title et les détails de la tâche sont décrits' do
      it 'Validation passes' do
        # Écrivez du contenu ici
        @task = Task.new( name: 'task',content: 'some content', expiry_date:DateTime.now,status:0,priority:1)
        expect(@task).to be_valid
      end
    end
  end
  describe 'You can search with the scope method' do
    before do
      @task1 = FactoryBot.create(:task, name: 'task1',content: 'something', expiry_date:DateTime.now,status:0,priority:1)
      @task2 = FactoryBot.create(:second_task, name: 'task2',content: 'something1', expiry_date:DateTime.now,status:1,priority:0)
      @task3 = FactoryBot.create(:task, name: 'task3',content: 'something2', expiry_date:DateTime.now,status:2,priority:1)
    end
    it 'You can search for titles' do
      expect(Task.title_search('task1')).to include(@task1)
    end
    it 'You can search the status' do
      expect(Task.order_by_status(1)).to include(@task2)
    end
    it 'You can search the priority' do
      expect(Task.order_by_priority(1)).to include(@task3)
    end
    it 'You can search for both title and status' do
      expect(Task.title_search('task3').order_by_status(2)).to include(@task3)
    end
  end
end
