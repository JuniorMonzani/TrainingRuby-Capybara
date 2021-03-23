describe 'iFrames' do
    describe 'iFrame bom', :nice_iframe do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/nice_iframe'
            sleep 3
        end

        it 'Adicionar ao carrinho' do
            #elemento do Capybara 'within_frame' para treabalhar com frame 
            within_frame('burgerId') do 
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                produto.find('a').click
                expect(find('#cart')).to have_content 'R$ 4,50'
            end
        end
    end

    describe 'iFrame ruim', :bad_iframe do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/bad_iframe'
            sleep 3
        end

        it 'Carrinho deve estar vazio' do
            #coloca em uma variável uma expresão javascript para adicionar um ID ao elemento 'box-iframe'
            script = '$(".box-iframe").attr("id", "tempId");'
            #chama o elemento do Capybara 'page.execute_script' informando o comando a ser executado
            page.execute_script(script)
            
            within_frame('tempId') do 
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
            end
        end
    end
end
