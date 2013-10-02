module UsesThis
  class Interview < Salt::Post

    def self.path
      "interviews"
    end

    def initialize(path)
      super
      @layout = 'interview'
    end
  end
end