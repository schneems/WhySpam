module MailFixture 
  FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures' 
  CHARSET = "utf-8" 
  def read_fixture(fixture) 
    IO.read("#{MailFixture::FIXTURES_PATH}/mmses/#{fixture}") 
  end 
end 
