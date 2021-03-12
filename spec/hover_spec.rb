describe 'Mouse hovers', :hovers do
  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/hovers'
    sleep 1
  end

  it 'Blade' do
    # expressão regular usa-se *, $ ou ^ (^ = começa com, $ = termina com, * = contém)
    card = find('img[alt*=Blade]')
    card.hover
    expect(page).to have_content 'Nome: Blade'
  end

  it 'Pantera Negra' do
    card = find('img[alt^=Pantera]')
    card.hover
    expect(page).to have_content 'Nome: Pantera Negra'
  end

  it 'Pantera Negra' do
    card = find('img[alt$=Aranha]')
    card.hover
    expect(page).to have_content 'Nome: Homem Aranha'
  end

  after(:each) do
    sleep 1
  end
end
