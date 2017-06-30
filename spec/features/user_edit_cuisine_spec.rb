require 'rails_helper'

feature 'User update cuisine' do
  scenario 'successfully' do
    #cria os dados necessários
    brazilian_cuisine = Cuisine.create(name: 'Brasileiro')

    # simula a ação do usuário
    visit root_path
    click_on 'Brasileiro'
    click_on 'Editar'

    fill_in 'Nome', with: 'Brasileira'

    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Brasileira')
  end

  scenario 'and all fields must be filled' do
    #cria os dados necessários, nesse caso não vamos criar dados no banco
    brazilian_cuisine = Cuisine.create(name: 'Brasileiro')

    # simula a ação do usuário
    visit root_path
    click_on 'Brasileiro'
    click_on 'Editar'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome da cozinha')
  end
end
