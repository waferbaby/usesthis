# frozen_string_literal: true

require 'bundler/setup'
require 'dimples'
require 'json'

# The main website's class.
class UsesThis < Dimples::Site
  def generate_post(post)
    super

    templates[:api_post].generate(
      output_path: File.join(@config.build_paths[:api][:posts], post.slug),
      payload: { post: post }
    )
  end

  def generate_posts
    super

    url = @config.build_paths[:api][:root].gsub(@config.build_paths[:root], '').concat('/interviews/')

    Dimples::Pager.paginate(url: url, posts: posts, options: @config.pagination) do |url, payload|
      templates[:api_posts].generate(
        output_path: File.join(@config.build_paths[:root], url),
        payload: payload
      )
    end
  end

  def generate_categories
    super

    categories.each do |category, posts|
      url = "/api/categories/#{category}/"

      Dimples::Pager.paginate(url: url, posts: posts, options: @config.pagination) do |url, payload|
        templates[:api_posts].generate(
          output_path: File.join(@config.build_paths[:root], url),
          payload: payload.merge(category: category)
        )
      end
    end
  end
end
