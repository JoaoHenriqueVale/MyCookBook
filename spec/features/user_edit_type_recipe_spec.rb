require 'rails_helper'

feature 'User update type recipe' do
  scenario 'successfully' do
    #cria os dados necessários

    appetizer_type = RecipeType.create(name: 'Entrado')


    # simula a ação do usuário
    visit root_path
    click_on 'Entrado'
    click_on 'Editar'

    fill_in 'Nome', with: 'Entrada'

    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Entrada')

  end

  scenario 'and all fields must be filled' do

    appetizer_type = RecipeType.create(name: 'Entrado')

    # simula a ação do usuário
    visit root_path
    click_on 'Entrado'
    click_on 'Editar'

    fill_in 'Nome', with: ''

    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome do tipo de receita')
  end
end
