desc 'Updates and synchronizes your base branch and feature branch.'
long_desc <<LONGTIME
  Performs the following:\n
  \t$ git checkout <base_branch>\n
  \t$ git pull <remote_location> <base_branch>\n
  \t$ git checkout <current_branch>\n
  \t$ git pull origin <current_branch>\n
  \t$ git merge <base_branch>\n
LONGTIME
arg_name '[remote_location] - remote repository name to fetch updates from (origin by default), [base_branch] - branch that you want to merge with (master by default)'
command :refresh do |c|
  c.desc 'updates base_branch based on remote and merges the base with your feature_branch'
  c.arg_name '[remote_location] - remote repository name to fetch updates from (origin by default),
          [base_branch] - branch that you want to merge with (master by default)'
  c.flag [:r,:remote], default_value: 'origin'
  c.flag [:b,:branch], default_value: 'master'
  c.action do |global_options, options, args|
    # usage: git reflow refresh [remote_location - defaults to origin] [base_branch_name - defaults to master]
    # defaults remote_location to origin

    refresh_options = {
      :remote => options[:remote],
      :branch => options[:branch]
    }

    GitReflow.update_feature_branch(refresh_options)
  end
end
