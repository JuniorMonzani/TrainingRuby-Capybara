# o atributo :dropdown é uma tag para a suite, assim ao executar o script e passado essa tag, somente ela será executada
describe 'Dropdown - Caixa de opções', :dropDown do
  it 'Item específico do combo box' do
    visit 'https://training-wheels-protocol.herokuapp.com/dropdown'

    # seleciona a opção Loki do combo onde buscamos pelo name 'dropdown'
    select('Loki', from: 'dropdown')
    sleep 3
  end

  it 'item específico com o find' do
    visit 'https://training-wheels-protocol.herokuapp.com/dropdown'

    # seleciona e escolhe a opção Scott Lang do combo buscando pelo nome da classe (quando não tem name ou id)
    drop = find('.avenger-list')
    drop.find('option', text: 'Scott Lang').select_option
    sleep 3
  end

  it 'seleciona qualquer item', :sample do
    visit 'https://training-wheels-protocol.herokuapp.com/dropdown'

    # seleciona e escolhe a opção Scott Lang do combo buscando pelo nome da classe (quando não tem name ou id)
    drop = find('.avenger-list')
    # busca por todos os elementos usando 'all' (retorna um array) pois o 'option' suporta somente 1
    drop.all('option').sample.select_option
  end
end
