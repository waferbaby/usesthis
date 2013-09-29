module UsesThis
  class Interview < Salt::Post

    def output_path(parent_path)
      File.join(parent_path, 'interviews', @slug)
    end

  end
end