namespace :flowdock do
  desc "Send deploy message to Flowdock."
  task notify: :environment do
    flows = Array(Settings.flowdock.api_token).map! do |api_token|
      Flowdock::Flow.new(
        api_token: api_token, external_user_name: 'Deployer', source: "lagdown",
        from: {name: "Deployer", address: "noreply@tomlan.tw"}
      )
    end

    flows.each do |flow|
      # flow.push_to_chat(content: "網站已成功佈署：http://lagdown.com/", tags: %w(deploy))
      flow.push_to_team_inbox(
        subject: "網站已成功佈署",
        content: %Q(
          <ul>
            <li>前台：http://lagdown.com/</li>
            <li>後台：http://lagdown.com/admin</li>
            <li>後台帳號：<code>#{Settings.http_auth_name}</code></li>
            <li>後台密碼：<code>#{Settings.http_auth_password}</code></li>
            <li>預設管理員帳號：<code>admin@lagdown.com</code></li>
            <li>預設管理員密碼：<code>12345678</code></li>
          </ul>
        ).gsub!(/^[\s\n]*|\n/, ''),
        tags: %w(deploy), link: "http://lagdown.com"
      )
    end
  end

end
