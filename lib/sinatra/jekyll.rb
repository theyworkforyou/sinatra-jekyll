require 'sinatra/jekyll/version'
require 'sinatra/base'
require 'jekyll'

module Sinatra
  module JekyllExtension
    class Error < StandardError; end

    module Helpers
      def render_into_jekyll_layout(content, options = {})
        page = Page.new(
          jekyll_site,
          jekyll_site.source,
          'sinatra',
          'index.html',
          content,
          options
        )
        Jekyll::Renderer.new(jekyll_site, page, jekyll_payload).run
      end

      def jekyll_payload
        @jekyll_payload ||= jekyll_site.site_payload
      end

      def jekyll_site
        settings.jekyll_site
      end
    end

    class Page < Jekyll::Page
      def initialize(site, base, dir, name, content, options = {})
        @site = site
        @base = base
        @dir  = dir
        @name = name

        process(name)
        self.content = content
        self.data = { 'layout' => 'default' }.merge(options)

        data.default_proc = proc do |_, key|
          site.frontmatter_defaults.find(File.join(dir, name), type, key)
        end

        Jekyll::Hooks.trigger :pages, :post_init, self
      end
    end

    def jekyll_site
      @jekyll_site ||= Jekyll::Site.new(Jekyll.configuration(source: jekyll_site_path)).tap do |s|
        s.reset
        s.read
      end
    end

    def self.registered(app)
      # Setup Jekyll and create a site object for rendering purposes
      Jekyll::PluginManager.require_from_bundler
      app.helpers Helpers
      app.set :jekyll_site_path, ->{ raise Error, "Please set :jekyll_site_path to point to your Jekyll site source" }
    end
  end

  register JekyllExtension
end
