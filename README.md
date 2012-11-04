# vk-dialogparser
This is simple ruby script for parsing vk dialogs.

To use it, you should install this gem: [vkontakte_api](https://github.com/7even/vkontakte_api) and perform some tuning:

1.  Follow next link:
`http://oauth.vk.com/authorize?client_id=3135748&scope=messages,offline&redirect_uri=http://oauth.vk.com/blank.html
&display=page&response_type=token`
You'll be redirected to link like:
`http://oauth.vk.com/blank.html#access_token=...&expires_in=0&user_id=...`

2.  Supply access_token in this link to access_token variable in script.rb (at line 31)

3.  Supply your companion id to other_user_id variable in script.rb (at line 33). You can see it, when you open dialog with your friend, it's url like `http://vk.com/im?sel=11111111`. 11111111 is what you need.

All dialog history will be saved to "dump" file, but you can change it's nae in script.rb (at line 37)