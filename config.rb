###
# Assets
###
set :sass_dir, 'assets/sass'
set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'

###
# Compass
###

compass_config do |config|
    config.output_style = :compact
end

###
# develop settings
###
configure :development do
  set :debug_assets, true
end

###
# build settings
###
configure :build do
  activate :minify_css
  activate :minify_javascript
end

###
# Set template languages
###
set :markdown, :layout_engine => :slim
set :blog_layout_engine, :slim
page '/feed.xml', :layout => false
page '/no_analytics_report.html', :layout => false

###
# GZIP text files
###
activate :gzip

###
# blog settings
###
Time.zone = 'Tokyo'

activate :syntax
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true

activate :blog do |blog|
  # blog.prefix = "blog"
  blog.layout = 'layouts/post'
  blog.paginate = true
  blog.permalink = ':year/:month/:day/:title.html'
  blog.sources = 'archives/:year-:month-:day-:title.html'
  blog.default_extension = '.md'
  blog.taglink = 'tags/:tag.html'
  blog.tag_template = 'tag.html'
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  blog.calendar_template = 'calendar.html'
  # blog.summary_separator = /(readmore)/
  # blog.summary_length = 250

  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

###
# compass
###

# susy grids in compass
# first: gem install susy
# require 'susy'

# change compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# page options, layouts, aliases and proxies
###

# per-page layout changes:
#
# with no layout
# page "/path/to/file.html", :layout => false
#
# with alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# a path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "rendering a fake page with a variable"
# end

###
# helpers
###

# automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "helping"
#   end
# end
