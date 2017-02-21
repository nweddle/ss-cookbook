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
      data: 0 }
  ]
  action :create
end

windows_package 'Slack' do
  source 'https://downloads.slack-edge.com/releases_x64/SlackSetup.exe'
  checksum 'afd5a6d28b8a2c41d63484f79869163e69a6a40ab93b759394829dd11376af52'
end
