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
        task = FactoryBot.create(:task, name: 'title', content: "content", expiry_date: DateTime.now, expiry_date:  DateTime.now, status: "unstarted", priority: 'Low') 
        # Transition vers la page de liste des tâches
        visit tasks_path
        current_path
        Task.count
        page.html

        # Le texte "tâche" apparaît sur la page visitée (avec transition) (page de liste des tâches)
        # attendre (confirmer / attendre) si have_content est inclus ou non (inclus)
        expect(page).to have_content 'title'
        # expectの結果が true ならtest成功、false なら失敗として結果が出力される
      end
    end
    context 'When tasks are arranged in descending order of deadline date and time' do
      it 'Task with higher deadline is displayed at the top' do  
        
        Task.order_by_deadline
        visit tasks_path(sort_expired: "true")
        task_list = all(".task_row")
        
        expect(task_list[0]).to have_content "title"
        expect(task_list[-1]).to have_content "title2"

      end
    end
  end
  describe "Fonction d'affichage détaillée" do
     context "Lors de la transition vers un écran de détails de tâche" do
       it "Le contenu de la tâche concernée s'affiche" do
       end
     end
  end
  describe 'Fonction de recherche' do
    let!(:task) { FactoryBot.create(:task, name: "title", content: "content1", expiry_date:  DateTime.now, status: "unstarted", priority: 'Low') }
    let!(:second_task) { FactoryBot.create(:second_task, name: "secondtask", content: "content2", expiry_date: ( DateTime.now +2), status: "progress", priority: 'High') }
    # before do
    #   # 必要に応じて、testデータの内容を変更して構わない
    #   @task = FactoryBot.create(:task, name: "task", content: "content1", expiry_date:  DateTime.now)
    #   @second_task = FactoryBot.create(:second_task, name: "task2", content: "content2", expiry_date: ( DateTime.now +2))
    # end
    context 'Si vous effectuez une recherche floue par Title' do
      it "Filtrer par tâches qui incluent des mots-clés de recherche" do
        visit tasks_path
        # Entrez un mot de recherche dans le champ de recherche de tâche (Exemple: task)
        # Appuyez sur le bouton de recherche
        expect(Task.title_search('title')).to include(task)
        expect(Task.title_search('task2')).not_to include(second_task)
        expect(Task.title_search('task').count).to eq 1
        expect(page).to have_content 'title'
      end
    end
    context 'Lorsque vous recherchez un statut' do
      it "Les tâches qui correspondent exactement au statut sont réduites" do
        # Mettre en œuvre ici
        # En savoir plus sur "sélectionner" qui sélectionne le déroulement
        visit tasks_path
        
        select 'unstarted', from: "search_status"
        click_on "search"
        expect(page).to have_content 'title'
        # select 'Low', from: "search_priority"
        # click_on "search"
        # expect(page).to have_content 'title'

        # select 'unstarted', from: "search_status"
        # click_on "search"
        # expect(page).to have_content 'title'

        # click_on "sort by end deadline"

      end
    end
    context "Search by title" do
      it "Return a list " do
        visit tasks_path
        fill_in "search_title",	with: "title" 
        expect(page).to have_content 'title' 
      end
      
    end
    
    context "Title une recherche floue du titre et d'une recherche d'état" do
      it "Affinez les tâches qui incluent des mots clés de recherche dans le Title et correspondent exactement à l'état" do
        # Mettre en œuvre ici
        visit tasks_path
        fill_in "search_title",	with: "title" 
        select 'Low', from: "search_priority"
        click_on "search"
        expect(page).to have_content 'title'
      end
    end

  end

end