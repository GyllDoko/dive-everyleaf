require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'バリデーションのtest' do
    context 'Si le Title la tâche est vide' do
      it "C'est difficile à Validation" do
        task = Task.new(title: '', content: '失敗test')
        expect(task).not_to be_valid
      end
    end
　　context 'Si les détails de la tâche sont vides' do
      it 'Validation est intercepté' do
        # Écrivez du contenu ici
      end
    end
    context 'Si le Title et les détails de la tâche sont décrits' do
      it 'Validation passes' do
        # Écrivez du contenu ici
      end
    end
end
