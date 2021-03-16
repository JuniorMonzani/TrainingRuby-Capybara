describe 'Alertas de Javacript', :alertsJavascript do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/javascript_alerts'
    end

    it 'Alerta', :alerts do
        click_button 'Alerta'
        #direciona para uma janela de alerta dentro da própria sessão do browser
        msg = page.driver.browser.switch_to.alert.text
        puts msg
        expect(msg).to eql 'Isto é uma mensagem de alerta'   
    end

    it 'Sim confirma', :confirm do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        puts 'Confirmando a mensagem'
        
        #o método 'accept' clica em 'OK' ou confirma a janela de alerta
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end

    it 'Não confirma', :not_confirm do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        puts 'Não confirmando a mensagem'
        
        #o método 'dimi' clica em 'Cancelar' ou cancela a janela de alerta
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'Prompt', :accept_prompt do        
        #o método 'accept_prompt' confirma a janela de alerta prompt aberta no browser, nesse caso passando o valor após abrir e confirmando em seguida
        accept_prompt(with: 'Fernando') do
            click_button 'Prompt'
            puts 'Confirmando msg no prompt'
        end
        expect(page).to have_content 'Olá, Fernando'
    end

    it 'Dismiss prompt', :dismiss_prompt do
        #o método 'dismiss_prompt' cancela a janela de alerta prompt aberta no browser
        dismiss_prompt() do
            click_button 'Prompt'
            puts 'Cancelando msg no prompt'
        end
        expect(page).to have_content 'Olá, null'
    end

    after(:each) do
        sleep 1
      end
end