describe 'Tables', :tables do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/tables'
    end

    it 'Deve exibir o salário do Stark' do
        #ALL = retorna todos o elementos que encontrar com esse css selector
        atores = all('table tbody tr')
        #utiliza o elemento 'detect' do Capybara para encontrar dentro do identificador 'ator' o valor 'Robert Downey Jr'
        stark = atores.detect { |ator| ator.text.include?('Robert Downey Jr')}

        expect(stark.text).to include '10.000.000' 
    end

    it 'Deve exibir o salario do Vin Diesel' do
        diesel = find('table tbody tr', text: '@vindiesel')
        
        expect(diesel).to have_content '10.000.000'
    end

    it 'Deve exibir o filme Velozes' do
        diesel = find('table tbody tr', text: '@vindiesel')
        #joga na variável o valor da posição 2 do array retornado pelo elemento 'all'
        movie = diesel.all('td')[2].text

        expect(movie).to eql 'Velozes e Furiosos'
    end

    it 'Deve exibir o insta do Chris Evans' do
        evans = find('table tbody tr', text: 'Chris Evans')
        insta = evans.all('td')[4].text

        expect(insta).to eql '@teamcevans'
    end

    it 'Deve selecionar Chris Pratt para deletar' do
        prat = find('table tbody tr', text: 'Chris Pratt')
        prat.find('a', text: 'delete').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    it 'Deve selecionar Chris Pratt para edição' do
        prat = find('table tbody tr', text: 'Chris Pratt')
        prat.find('a', text: 'edit').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
    end
end