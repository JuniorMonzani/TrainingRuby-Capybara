describe 'Upload', :upload do
  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/upload'

    # pega oi diretório raiz diretporio de execução do projeto, assim da pra montar o caminho relativo das imagens
    @arquivo = Dir.pwd + '/spec/fixtures/GuideNewAccessAutomaticsTests.txt'
    @imagem = Dir.pwd + '/spec/fixtures/MDAcesso.jpg'
  end

  it 'Upload com arquivo texto' do
    attach_file('file-upload', @arquivo)
    click_button 'Upload'

    div_arquivo = find('#uploaded-file')
    expect(div_arquivo.text).to eql 'GuideNewAccessAutomaticsTests.txt'
  end

  it 'Upload com imagem', :uploadImagem do
    attach_file('file-upload', @imagem)
    click_button 'Upload'

    img = find('#new-image')
    expect(img[:src]).to include '/uploads/MDAcesso.jpg'
  end

  after(:each) do
    sleep 2
  end
end
