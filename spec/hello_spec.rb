describe  'Meu primeiro script', :hello do
  it      'visitar a página' do
    puts  'Acessando a página'
    visit 'https://training-wheels-protocol.herokuapp.com'

    expect(page.title).to eql 'Training Wheels Protocol'
  end
end
