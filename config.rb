###
# Assets
###
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
  activate :directory_indexes
end

###
# build settings
###
configure :build do
  # activate :minify_css
  # activate :minify_javascript
  activate :directory_indexes
end
set :build_dir, "tmp"

###
# Set template languages
###
set :markdown, :layout_engine => :slim
set :blog_layout_engine, :slim
set :slim, { :pretty => true, :sort_attrs => false, :format => :html5 }
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

###
# Syntax Highlighting
###
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
