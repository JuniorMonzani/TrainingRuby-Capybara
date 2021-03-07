describe 'Drag and Drop', :dragDrop do
  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/drag_and_drop'
    sleep 1
  end

  it 'Homem Aranha pertence ao time Stark' do
    stark = find('.team-stark .column')
    cap   = find('.team-cap .column')

    spiderman = find('img[alt$=Aranha]')
    spiderman.drag_to stark

    expect(stark).to have_css   'img[alt$=Aranha]'
    expect(cap).not_to have_css 'img[alt$=Aranha]'
  end
end
