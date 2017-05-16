require 'bundler/setup'
require 'haml'
require 'sass'
require 'redcarpet'
require 'rake/clean'

require 'yaml'

pages = %w(index persoenliches vollmachten kosten kontakt lage impressum hinweise)

SRC = FileList['views/*.markdown']
OBJ = FileList['public/style.css']

CLOBBER.include('public/*.html')
CLOBBER.include('public/style.css')

SRC.each do |src|
  target = src.pathmap("public/%n.html")
  file(target => [src, 'views/layout.haml']) do
    File.open(target, 'w') { |f| f.puts(haml(src)) }
  end
  OBJ.push(target)
end

def markdown(file)
  @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :tables => true)
  @markdown.render(File.read(file))
end

def haml(file)
  @haml ||= Haml::Engine.new(File.read('views/layout.haml'))
  @haml.render { markdown(file) }
end

def scss(file)
  @sass = Sass::Engine.new(File.read(file), :syntax => :scss)
  @sass.render
end

file 'public/style.css' => 'views/style.scss' do |t|
  Dir.mkdir('public') unless File.directory?('public')
  File.open(t.name, 'w') do |f|
    f.write(scss('views/style.scss'))
  end
end

desc "Build the site"
task :build => OBJ

task :default => :build
