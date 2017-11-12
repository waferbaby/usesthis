module UsesThis
  module Api
    class InterviewsGenerator < BaseGenerator
      def generate
        interviews = @site.posts.map(&:to_h)

        interviews.each do |interview|
          path = File.join(@output_path, 'interviews', interview[:slug])

          endpoint = Endpoint.new(path, [interview], 'interviews')
          endpoint.publish
        end

        interviews.map do |interview|
          interview.reject { |key,| [:contents, :gear].include?(key) }
        end

        paginate(interviews, 'interviews', File.join(@output_path, 'interviews'))
      end
    end
  end
end