require 'rubygems'
require 'yaml'
require 'kramdown'

class Interview
  attr_accessor :slug, :date, :name, :summary, :categories, :wares, :credits, :answers

  def initialize(path)
    parts = File.basename(path, File.extname(path)).match(/(\d{4})-(\d{2})-(\d{2})-(.+)/)

    @date = Time.mktime(parts[1], parts[2], parts[3])
    @slug = parts[4]
    @wares = []

    begin
      contents = File.read(path)
      parts = contents.match(/^(-{3}\n.*?\n?)^(-{3}*$\n?)/m)

      metadata = YAML::load(parts[1])
      @answers = parts.post_match.strip!

      %w(name summary categories credits).each do |item|
        self.send("#{item}=", metadata[item])
      end
    rescue
    end
  end

  def to_s
    output = @answers

    if @wares.length > 0
      output << "\n\n"

      @wares.each do |ware|
        output << "[#{ware.slug}]: #{ware.url} \"#{ware.description}\"\n"
      end
    end

    output
  end

  def to_markdown
    Kramdown::Document.new(self.to_s, auto_ids: false).to_html
  end
end