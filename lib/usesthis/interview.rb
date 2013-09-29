module UsesThis
  class Interview < Salt::Post

    def initialize(site, path)
      super(site, path)
      @metadata['layout'] = 'interview'
    end

    def output_path(parent_path)
      File.join(parent_path, 'interviews', @slug)
    end
  end
end