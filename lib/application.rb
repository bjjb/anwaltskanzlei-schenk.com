require 'sinatra'
require 'haml'
require 'sass'
require 'redcarpet'

class Application < Sinatra::Base
  @@pages = %w(index persoenliches rechtsgebiete vollmachten kosten kontakt
              lage impressum hinweise)

  configure do
    set :views, './views'
    set :haml, :format => :html5
    set :markdown, :layout_engine => :haml
  end

  get '/' do
    markdown :index
  end

  @@pages.each do |page|
    get "/#{page}.html" do
      markdown page.to_sym
    end
  end

  get '/style.css' do
    scss :style
  end
end
