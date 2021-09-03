require 'rails_helper'
RSpec.describe 'Fonction de gestion des tâches', type: :system do
  before do
    # あらかじめタスク一覧のtestで使用するためのタスクを二つ作成する
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
 
  describe "Nouvelle fonction de création" do
    context "Lors de la création d'une nouvelle tâche" do
      it "La tâche créée s'affiche" do
      end
    end
  end
  describe "Fonction d'affichage de liste" do
    context "Lors de la transition vers l'écran de liste" do
      it "La liste des tâches créées s'affiche" do
        # testで使用するためのタスクを作成
        task = FactoryBot.create(:task, name: 'task')
        # Transition vers la page de liste des tâches
        visit tasks_path
        
        
        current_path
        Task.count
        page.html
      
        # Le texte "tâche" apparaît sur la page visitée (avec transition) (page de liste des tâches)
        # attendre (confirmer / attendre) si have_content est inclus ou non (inclus)
        expect(page).to have_content 'task'
        # expectの結果が true ならtest成功、false なら失敗として結果が出力される
      end
    end
  end
  describe "Fonction d'affichage détaillée" do
     context "Lors de la transition vers un écran de détails de tâche" do
       it "Le contenu de la tâche concernée s'affiche" do
       end
     end
  end
end