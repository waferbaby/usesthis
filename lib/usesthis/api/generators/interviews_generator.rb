module UsesThis
  module Api
    class InterviewsGenerator < BaseGenerator
      def generate
        interviews = @site.posts.map(&:to_h)

        interviews.each do |interview|
          path = File.join(@output_path, 'interviews', interview[:slug])
          json = build_json('interviews', [interview])

          publish_json_file(path, json)
        end

        interviews.map do |interview|
          interview.clone.delete_if { |key,| [:contents, :gear].include?(key) }
        end

        paginate('interviews', interviews, File.join(@output_path, 'interviews'))
      end
    end
  end
end