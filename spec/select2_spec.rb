describe 'Select2', :select2 do
    describe 'Select Single', :single do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/apps/select2/single.html'
        end

        it 'Seleciona ator por nome' do
            #encontra o elemento (dropbox ingle) e clica
            find('.select2-selection--single').click
            sleep 1
            find('.select2-results__option', text: 'Adam Sandler').click
            sleep 1
        end

        it 'busca e clica no ator' do
            find('.select2-selection--single').click
            sleep 1
            find('.select2-search__field').set 'Chris Rock'
            sleep 1
            find('.select2-results__option').click
            sleep 1
        end
    end

    describe 'Multiple', :multi do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/apps/select2/multi.html'
        end


        #cria um método que recebe um ator e realiza buscas utilizando o mesmo
        def selecione(ator)
            find('.select2-selection--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click
        end

        it 'Seleciona atores' do
            #cria array com atores
            atores = ['Jim Carrey', 'Owen Wilson', 'Kevin James']
            #percorre o array chamando o método selecine para cada ator do array
            atores.each do |a|
                selecione(a)
            end
        end
    end            
    after(:each) do
        sleep 2
      end
end
