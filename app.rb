require 'sinatra'
require 'csv'

get '/' do
  erb :index
end

get '/vote' do

  @name = params["name"]
  @vote = params["vote"]

  # CSV는 엑셀로 파일이 열린다.
  CSV.open("vote.csv", "a") do |row|
    row << [@name, @vote]
  end

  erb :vote
end

get '/result' do

  @list = Array.new
  # @list = [] 위의 코드와 같은 내용이다.

  #@count = {}
  @count = Hash.new(0)

  # CSV에 있는 내용을 한줄 한줄 읽어온다.
  # 같은 폴더에 있기에 파일명만 사용한다.
  # 같은 폴더가 아니라면 경로를 적어주어야 한다.
  # 읽어온 한 줄을 list에 넣어준다.
  CSV.foreach('vote.csv') do |row|
   @list << row
   if row[1] == "1"
     @count["1hour"] += 1
   elsif row[1] == "2"
     @count["2hour"] += 1
   elsif row[1] == "3"
     @count["3hour"] += 1
   end
  end

  erb :result
end
