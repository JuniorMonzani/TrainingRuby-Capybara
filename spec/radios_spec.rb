describe 'Selecionando radio buttons', :radio do
  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/radios'
    sleep 1
  end

  it 'Seleção por ID' do
    choose('cap')
  end

  it 'Seleção por find e css selector' do
    find('input[value=guardians]').click
  end

  after(:each) do
    sleep 2
  end
end
