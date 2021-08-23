require 'rails_helper'

describe 'Task', type: :model do
  describe 'Task Model test' do
    context 'Si le Title la tâche est vide' do
      it "C'est difficile à Validé" do
        task = Task.new(name: '', content: 'content test')
        expect(task).not_to be_valid
      end
    end
  end
  describe "Task Model test" do
    context "Si les détails de la tâche sont vides" do
      it "validation interceptés" do
        
      end
    end
  end
  describe "Task model Test" do
    context "sile titre et les détails sont décrits" do
      it "validation passes" do
        
      end
    end
  end

end