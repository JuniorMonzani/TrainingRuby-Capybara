describe 'Id Dinâmico', :ids_dinamicos do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/access'
    end

    it 'cadatro' do
        #realiza a busca CSS selector utilizando expressões
        find('input[id$=UsernameInput]').set 'Fernando'
        find('input[id^=PasswordInput]').set '123456'
        find('a[id*=GetStartedButton]').click
       
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end

    after(:each) do
        sleep 1
      end
end