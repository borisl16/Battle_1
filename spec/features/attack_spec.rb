feature 'Attacking' do
    scenario 'attack Player 2' do
      sign_in_and_play
      save_and_open_page
      click_button 'Attack'
      expect(page).to have_content 'Charlotte attacked Mittens'
    end
  end
  