# frozen_string_literal: true

module UsesThis
  module Api
    # A class that generates all interview API endpoints.
    class InterviewsGenerator < BaseGenerator
      def generate
        interviews = @site.posts.map(&:to_h)

        interviews.each do |interview|
          path = File.join(@output_path, 'interviews', interview[:slug])
          Endpoint.publish(path, [interview], 'interviews')
        end

        interviews.map! do |interview|
          interview.reject { |key,| %i[contents gear credits].include?(key) }
        end

        path = File.join(@output_path, 'interviews')
        paginate(interviews, 'interviews', path)
      end
    end
  end
end
