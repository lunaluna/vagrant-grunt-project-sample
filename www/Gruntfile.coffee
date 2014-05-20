module.exports = (grunt) ->

		# パッケージファイルの読み込み
	pkg = grunt.file.readJSON 'package.json'

	grunt.initConfig
		dir: # ディレクトリ設定
			src: "dev/_src" # _srcフォルダ置き換え
			dev: "dev" # devフォルダ置き換え
			release: "release" # releaseフォルダ置き換え

		compass: # Compassの設定
			default:
				options:
					config: "config.rb" # confing.rbを読み込む

		autoprefixer: # ベンダープレフィックス付与設定
			options:
				browsers: [ "last 2 version","ie 8","ie 9" ] # 対象ブラウザの設定
			default:
				src: "<%= dir.dev %>/style.css" # 読み込みファイル
				dest: "<%= autoprefixer.default.dev %>" # 書き出しファイル 同じファイルが続くので置き換える

		csso: # CSSの圧縮＆オプティマイズ
			default:
				src: "<%= dir.release %>/style.css" # 読み込みファイル
				dest: "<%= csso.default.release %>"

		copy: # ファイルのコピー
			release:
				expand: true
				cwd: "<%= dir.dev %>/"
				src: "**"
				dest: "<%= dir.release %>"
			images:
				expand: true
				cwd: "<%= dir.dev %>/"
				src: "images/*.{jpg,gif,png}"
				dest: "<%= dir.release %>/"

		clean: # 不要なファイルを削除する
			deleteRelease: # releaseフォルダ内のhtml以外を一度全て削除する
				src: "<%= dir.release %>/_src"

		concat: # ファイル結合
			cssset: # css結合
				# 結合するファイルリスト
				src: "<%= dir.src %>/css/*.css"
				dest: "<%= dir.dev %>/style.css" # 結合後のファイル格納

			jsdefault: # ライブラリ等との結合
				# 結合のファイルリスト
				src: ["<%= dir.src %>/js/lib/*.js","<%= dir.src %>/js/script/*.js"]
				dest: "<%= dir.dev %>/js/script.js" # 結合後のファイル格納

			license: # ライセンス表示のための結合タスク
				# 結合するファイルリスト
				src: ["<%= dir.src %>/js/license/license.js","<%= dir.release %>/js/script.js"]
				dest: "<%= dir.release %>/js/script.js" # 結合後のファイル格納

		uglify: # jsの圧縮
			default:
				src: "<%= dir.release %>/js/script.js"
				dest: "<%= uglify.default.release %>"

		connect: # 簡易サーバー
			options:
				port: 8080,
				hostname: '*'
			livereload:
				options:
					base: 'dev/',
					open: true

		imagemin: # 画像圧縮
			dynamic:
				files: [
					expand: true,
					cwd: '<%= dir.release %>/',
					src: 'images/*.{jpg,gif,png}',
					dest: '<%= imagemin.dynamic.release %>'
					]

		watch: # ファイル更新監視
			options: # ライブリロードを有効にする
				livereload: true

			sass: # scssの監視
				files: "<%= dir.src %>/sass/*.scss" # 対象ファイル
				tasks: ["compass","concat:cssset"] # 実行タスク（css開発用）

			jsdev: # jsの監視
				files: "<%= dir.src %>/js/**/*.js" # 対象ファイル
				tasks: "concat:jsdefault" # 実行タスク（js開発用）

			html: # htmlの監視
				files: "<%= dir.dev %>/*.html"

		# パッケージをロード
	grunt.loadNpmTasks "grunt-autoprefixer"
	grunt.loadNpmTasks "grunt-contrib-clean"
	grunt.loadNpmTasks "grunt-contrib-compass"
	grunt.loadNpmTasks "grunt-contrib-concat"
	grunt.loadNpmTasks "grunt-contrib-connect"
	grunt.loadNpmTasks "grunt-contrib-copy"
	grunt.loadNpmTasks "grunt-contrib-imagemin"
	grunt.loadNpmTasks "grunt-contrib-uglify"
	grunt.loadNpmTasks "grunt-contrib-watch"
	grunt.loadNpmTasks "grunt-csscomb"
	grunt.loadNpmTasks "grunt-csso"

	# 以下タスクの登録
	# デフォルト（各ファイル監視してビルド）
	grunt.registerTask "default", [
		"connect"
		"watch"
	]

	# 開発用ビルド 必要に応じて適宜
	grunt.registerTask "dev", [
		"compass"
		"concat:cssset"
		"autoprefixer"
		"concat:jsdefault:"
		]

	# リリース用ビルド
	grunt.registerTask "release", [
		"copy:release"
		"clean:deleteRelease"
		"csso"
		"uglify"
		"concat:license"
		"imagemin"
	]
	return
