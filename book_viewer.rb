require "sinatra"
<<<<<<< HEAD
require "sinatra/reloader"
require "tilt/erubis"

helpers do

  def in_paragraphs(text)
    text.split("\n\n").map do |line|
      "<p>#{line}</p>"
    end.join
  end

=======
require "sinatra/reloader" if development? 
require "tilt/erubis"

helpers do
  def in_paragraphs(content)
    content.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end

  def highlight(text, term)
    text.gsub(term, "<strong>#{term}</strong>")
  end
>>>>>>> my-application
end

before do
  @contents = File.readlines("data/toc.txt")
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
<<<<<<< HEAD

=======
>>>>>>> my-application
  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"
<<<<<<< HEAD

=======
>>>>>>> my-application
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

<<<<<<< HEAD
=======
get "/search" do
  query = params[:query]
  if query
    @results = @contents.each_with_index.each_with_object([]) do |(chapter, index), results|
      text = File.read("data/chp#{index + 1}.txt")
      paragraphs = text.split("\n\n")
      paragraphs.each_with_index do |paragraph, paragraph_index|
        results << [chapter, index, paragraph, paragraph_index] if paragraph.include?(query)
      end
    end
  end
  erb :search
end

>>>>>>> my-application
not_found do
  redirect "/"
end
