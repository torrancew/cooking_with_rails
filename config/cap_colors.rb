require 'capistrano_colors'

color_matchers = [
  { :match => /keeping \d+ of \d+ deployed releases/, :color => :green,   :prio => 10 },
  { :match => /command finished in \d+ms/,            :color => :cyan,    :prio => 10 },
  { :match => /(^servers:|executing command$)/,       :color => :magenta, :prio => 10 },
  { :match => /(transaction|error)/,                  :color => :red,     :prio => 10 },
]

colorize( color_matchers )

