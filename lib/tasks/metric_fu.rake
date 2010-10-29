require 'metric_fu'

if Rails.env == 'development'
  MetricFu::Configuration.run do |config|

    config.metrics = [:churn, :stats, :flog, :flay, :reek, :roodi]
    config.graphs = [:flog, :flay, :reek, :roodi]

    config.churn = {:start_date => "1 year ago", :minimum_churn_count => 10}
    # AKK: enable rcov, some day
    config.rcov = {:environment => 'test',
                   :test_files => ['test/**/*_test.rb'],
                   :rcov_opts => ['--sort coverage',
                                  '--no-html',
                                  '--text-coverage',
                                  '--no-color',
                                  '--profile',
                                  '--rails',
                                  '--include test',
                                  '--include-file app/**/*.rb lib/**/*.rb',
                                  '--exclude /Library']
                                 }

  end
end

