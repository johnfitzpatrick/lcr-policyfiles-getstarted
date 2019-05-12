#
# Cookbook:: patching
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

patch_sentinel = File.join(Chef::Config.file_cache_path, 'chef_patching_sentinel')

case node['platform_family']
when 'debian'
  execute 'apt-get upgrade -y'

  file patch_sentinel do
    mode '0600'
    content node['patching']['patchlevel'].to_s
  end

when 'rhel', 'fedora', 'amazon'
  execute 'yum update -y'

  file patch_sentinel do
    mode '0600'
    content node['patching']['patchlevel'].to_s
  end
end
