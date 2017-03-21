#
# Cookbook:: ss-cookbook
# Recipe:: remediate
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'audit'

registry_key 'HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop' do
  values [
    { name: 'ScreenSaveActive',
      type: :string,
      data: '1' },
    { name: 'ScreenSaverIsSecure',
      type: :string,
      data: '1' },
    { name: 'ScreenSaveTimeOut',
      type: :string,
      data: '600' }
  ]
  recursive true
  action :create
  notifies :run, 'execute[group-policy-update]', :immediately
end

execute 'group-policy-update' do
  command 'gpupdate /force'
  action :nothing
end

windows_package 'Slack' do
  source 'https://slack-ssb-updates.global.ssl.fastly.net/releases_x64/SlackSetup.msi'
  checksum 'fc0d2120a513f770f45258aa3fe3043525a4e492a9da7b3fe9d0c15c3f7d2152'
end
