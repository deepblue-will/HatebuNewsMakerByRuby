#HatebuNewsMakerByRuby
はてブしたサイトのまとめ記事を作るためのRubyスクリプトです。  
実行すると、targetディレクトリにファイルが出力されます。

##使い方
###はてブアカウント名を設定する
以下のファイルに設定したアカウント名のはてブを取得します。  
`resources/setting.yml`

    account:
       user_name: ここにはてブのアカウント名を設定

###実行
スクリプトを実行すると、いくつか条件を指定します。
 1. 取得するはてブの条件(日付による範囲指定)
 2. まとめ記事のフォーマット  

`$ ruby src/main.rb`

    start_date?(yyyymmdd)
    取得するはてブの開始日をyyyymmdd(例:20140301)入力
    ※ 範囲指定をしない場合、何も入力せずにEnter
    
    end_date?(yyyymmdd)
    取得するはてブの終了日をyyyymmdd(例:20140302)入力
    ※ start_dateを入力しなかった場合は聞かれません
    
    format_number?(1, 2...)(see template.yml)
    使用するフォーマットを入力します。(例：1)
    
##仕様
###setting.yml
このスクリプトの設定ファイルです。  
`resources/setting.yml`

    account:
       user_name: deepblue_will # 取得するはてブのアカウント名
    proxy:                      # プロキシ設定
       host:
       port:
       user_name:
       password:
    get_feed_policy:
       max_days: 14             # 日付指定した場合に最大日数
       get_pages: 1             # 日付指定しなかった場合の最大ページ数(1ページ20件はてブを取得します)

###template.yml
まとめ記事を作成するためのフォーマットを定義するファイルです。  
フォーマットは複数定義可能です(スクリプト実行時にどのフォーマットを使用するか指定する)  
ここで設定するフォーマットには以下の変数が使用できます。  

`%url%` : サイトのURL  
`%title%` : サイトのタイトル  
`%comment%` : はてブコメント  

`resources/template.yml`

    # {n}は数字(スクリプト実行時はこの数字を指定)。この塊を複数書くことで、複数のフォーマットを指定できます。
    format{n}: 
       outer_start: <ul class="news">
       outer_end: </ul>
       inner: <li class="news_item"><a href="%url%" target="_blank">%title%</a></li>

###実行環境
Ruby1.9以上
