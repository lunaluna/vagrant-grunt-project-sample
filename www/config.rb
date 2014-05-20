# パス設定
http_path = "/"
css_dir = "dev/_src/css/"
sass_dir = "dev/_src/sass/"
# images_dir = "_src/img/"
javascripts_dir = "dev/_src/js/"

# .sass-cacheを出力するか
cache = false

# クエストにクエリ文字列付けてキャッシュ防ぐ
asset_cache_buster :none

# Sassファイルをブラウザで確認
sass_options = { :debug_info => false }

# cssの主力形式
# output_style = :compressed
output_style = :expanded

# trueで相対パス、falseで絶対パス
relative_assets = true

# CSSファイルにSassファイルの何行目に記述されたものかを出力する
line_comments = false
