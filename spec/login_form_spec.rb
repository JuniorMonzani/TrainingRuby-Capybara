describe 'Forms', :forms do
  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/login'
    sleep 1
  end
  
  it 'login com sucesso' do
    # preenche com um valor o campo especificado (busca por 'name', 'id')
    fill_in 'username', with: 'stark'
    fill_in 'password', with: 'jarvis!'

    # clicando em botão com o nome Login
    click_button 'Login'
    # buscar por elemento na página
    expect(find('#flash').visible?).to be true

    # to eql verifica se é identico o que eu espero da página
    # o include verifica se a mensagem esperada se encontra dentro do que estou buscando
    # have_content verifica se existe o conteúdo no elemento
    expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
  end

  after(:each) do
    sleep 2
  end
  
end
