#
# Cookbook:: ss-cookbook
# Recipe:: remediate
#
# Copyright:: 2017, The Authors, All Rights Reserved.

registry_key 'HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop' do
  values [
    { name: 'ScreenSaveActive',
      type: :string,
      data: 1 },
    { name: 'ScreenSaverIsSecure',
      type: :string,
      data: 1 },
    { name: 'ScreenSaveTimeOut',
      type: :string,
      data: 600 }
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
  checksum '70d30a739702a05625ac3d606a158526e814d436a8cfbdd5304f68430cae6bc7'
end
