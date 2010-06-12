<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
<head>
<meta name="Content-Language" content="ja">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 12 Jun 2010 04:37:36 GMT">
<!--[if lte IE 6]><style type="text/css">body {behavior: url(/css/csshover.htc);}</style><![endif]-->
<link rel="stylesheet" type="text/css" href="http://static.sourceforge.jp/css/sfx.net.css?t=1269572629">
<!--[if lte IE 7]><link rel="stylesheet" type="text/css" href="http://static.sourceforge.jp/css/iestyles.net.css?t=1261640897"><![endif]-->
<!--[if lte IE 6]><link rel="stylesheet" type="text/css" href="http://static.sourceforge.jp/css/ie6styles.net.css?t=1267066723"><![endif]-->
<link rel="stylesheet" type="text/css" href="http://static.sourceforge.jp/css/sf.jp.theme.css?t=1276247717">
<link rel="stylesheet" type="text/css" href="http://static.sourceforge.jp/wiki/css/wiki.css?t=1267012105">
<link rel="stylesheet" type="text/css" href="http://static.sourceforge.jp/css/wiki-compact.css?t=1270636999">
<link rel="stylesheet" type="text/css" href="http://static.sourceforge.jp/css/print.css?t=1220439204" media="print">
<link rev="MADE" href="mailto:webmaster@sourceforge.jp">
<link rel="INDEX" href="http://sourceforge.jp/">
<link rel="CONTENTS" href="http://sourceforge.jp/">
<link rel="SHORTCUT ICON" href="http://static.sourceforge.jp/favicon.ico" type="image/x-icon">
<meta name="description" content="２ちゃんねる用ブラウザ「ギコナビ」を作成するプロジェクトです。">
<meta name="keywords" content="オープンソース,フリー,ソフトウェア,ソフト,Open Source,OSS,開発者,Developer,リポジトリ,ダウンロード,GPL,CVS,SVN,Git">
<link rel="stylesheet" type="text/css" href="http://static.sourceforge.jp/css/viewvc.css?t=1244181667">
<link rel="alternate" title="Recent project news" href="http://sourceforge.jp/projects/gikonavi/news/rss" type="application/rss+xml">
<link rel="alternate" title="Recent release" href="http://sourceforge.jp/projects/gikonavi/releases/rss" type="application/rss+xml">
<link rel="alternate" title="Project wiki updates" href="http://sourceforge.jp/projects/gikonavi/wiki/!feeds/diff" type="application/rss+xml">
<link rel="alternate" title="Recent wiki page list" href="http://sourceforge.jp/projects/gikonavi/wiki/!feeds/list" type="application/rss+xml">
<link rel="alternate" title="Project History" href="http://sourceforge.jp/projects/gikonavi/history/rss" type="application/rss+xml">
<script language="JavaScript" type="text/javascript" src="//ads.osdn.jp/x/delivery/spcjs.php?id=2"></script><script language="JavaScript" type="text/javascript" src="http://static.sourceforge.jp/js/sfjp-adsense.js?t=1270632419"></script><script language="JavaScript" type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script><title>Log of /gikonavi/gikonavi/Gesture.pas - ギコナビ - SourceForge.JP</title>
</head>
<body>

<div id="main_header">
<div id="first_head">
<h1 id="sitelogo"><a title="" href="http://sourceforge.jp/">SourceForge.JP: オープンソース・ソフトウェアの開発とダウンロード</a></h1>
<div id="jump"><a href="#content">Jump to main content</a></div>
<div id="user-menu"><span class="menu-item"><a href="https://sourceforge.jp/account/login.php?return_to=%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog">ログイン</a></span><span class="menu-item"><a href="/account/register.php">アカウント作成</a></span><span class="menu-item" id="head-bookmarkmenu"><a href="#">ブックマークする</a><span id="head-bookmarkmenu-submenu" class="head-submenu"></span><script type="text/javascript">document.getElementById("head-bookmarkmenu-submenu").innerHTML = '<a title="このページをスラッシュドットにタレこむ" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=1&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-slashdotjp"></span>スラッシュドット</a><a title="このページを Yahoo! ブックマークに登録" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=2&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-yahoo"></span>Yahoo!ブックマーク</a><a title="このページをはてなブックマークに登録" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=3&bookmark_url=http://sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;view=log&bookmark_title=Log of /gikonavi/gikonavi/Gesture.pas - ギコナビ - SourceForge.JP"><span class="bm-icon spimg-bm-hatena"></span>はてなブックマーク</a><a title="このページをlivedoorクリップに登録" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=4&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-livedoor"></span>livedoorクリップ</a><a title="このページをGoogleブックマークに登録" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=5&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-google"></span>Googleブックマーク</a><a title="このページをdeliciousに登録" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=6&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-delicious"></span>delicious</a><a title="このページを@nifty クリップに登録" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=7&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-nifty"></span>@nifty クリップ</a><a title="このページをBuzzurlに登録" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=8&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-buzzurl"></span>Buzzurl</a><a title="このページをFC2ブックマークに登録" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=9&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-fc2"></span>FC2ブックマーク</a><a title="Retweetする(Twitterにつぶやく)" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=11&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-twitter"></span>Rewteet(Twitterへつぶやく)</a>';</script></span><span class="menu-item"><a href="/docs/">ヘルプ</a></span><span class="menu-item"><a href="http://sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;view=log" title="auto"><span class="spclass-nontext spimg-auto">[auto]</span></a></span><span class="menu-item"><a href="http://en.sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;view=log" title="English"><span class="spclass-nontext spimg-en">[en]</span></a></span><span class="menu-item"><a href="http://zh.sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;view=log" title="中文"><span class="spclass-nontext spimg-zh">[zh]</span></a></span><span class="menu-item"><a href="http://de.sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;view=log" title="Deutsch"><span class="spclass-nontext spimg-de">[de]</span></a></span><span class="menu-item"><a href="http://fr.sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;view=log" title="Français"><span class="spclass-nontext spimg-fr">[fr]</span></a></span><span class="menu-item"><a href="http://ko.sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;view=log" title="한국말"><span class="spclass-nontext spimg-ko">[ko]</span></a></span><span class="menu-item"><a href="http://es.sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;view=log" title="Español"><span class="spclass-nontext spimg-es">[es]</span></a></span><span class="menu-item"><a href="http://pt.sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;view=log" title="Português"><span class="spclass-nontext spimg-pt">[pt]</span></a></span></div>
</div><!-- first_head -->

<div id="ad-leaderboard"><script type='text/javascript'><!--// <![CDATA[
OA_show(4);
// ]]> --></script>
<noscript><iframe id='acf99adf' name='acf99adf' src='http://ads.osdn.jp/x/delivery/afr.php?zoneid=55&amp;cb=1mmsn98m' frameborder='0' scrolling='no' width='1' height='1' allowtransparency='true'></iframe></noscript>
<script type='text/javascript'><!--// <![CDATA[
OA_show(3);
// ]]> --></script>
<noscript><iframe id='aa05f8d3' name='aa05f8d3' src='http://ads.osdn.jp/x/delivery/afr.php?zoneid=37&amp;cb=1mmsn98m' frameborder='0' scrolling='no' width='728' height='90' allowtransparency='true'></iframe></noscript></div><!-- id="ad-leaderboard" --><div id="second_head">
<div class="bar_left"></div><div class="bar_right"></div><div id="main_nav"><span class="menu-item"><a href="/my/">MY SF.JP</a></span><span class="separater"></span><span class="menu-item"><a href="/softwaremap/">ソフトウェアを探す</a></span><span class="separater"></span><span class="menu-item"><a href="/magazine/">Magazine</a></span><span class="separater"></span><span class="menu-item"><a href="/career/">キャリア</a></span><span class="separater"></span><span class="menu-item"><a href="/projects/ossdirectory/wiki/FrontPage">ビジネス</a></span><span class="separater"></span><span class="menu-item"><a href="/develop/">開発</a></span><span class="separater"></span></div><!-- #main_nav --><div id="search"><form name="searchform" action="/search/" method="GET" id="searchform">
			<input type="hidden" name="ie" value="UTF-8" />
			<span class="top_search" id="top_search_select">
			<select name="t" onChange="switch (this.options[this.selectedIndex].value) {
			case 'soft': case 'people': document.getElementById('searchform').action='/search/'; break;
			case 'magazine': document.getElementById('searchform').action='/magazine/search/'; break;
			case 'wiki': document.getElementById('searchform').action='/wiki/!search'; break;
			}">
			<option value="soft">ソフトウェア</option>
			<option value="people">人物</option>
			<option value="magazine" >Magazine</option>
			<option value="wiki" >Wiki</option>
			</select>
			</span><!-- #top_search_select -->
			<input type="hidden" name="scope" value="all">
			<span class="top_search" id="top_search_text">
			<input type="text" value="" id="searchbox" name="q" tabindex="1" />
			</span><!-- #top_search_text -->
			<span class="top_search" id="top_search_submit">
			<input type="submit" title="検索" value="検索" id="searchsubmit" tabindex="0" />
			</span><!-- #top_search_submit -->
			</form></div><!-- #search -->
</div><!-- #second_head -->
<div id="head-ad-text"><script type='text/javascript'><!--// <![CDATA[
OA_show(50);
// ]]> --></script>
<noscript><iframe id='ad5fa660' name='ad5fa660' src='http://ads.osdn.jp/x/delivery/afr.php?zoneid=58&amp;cb=1mmsn98m' frameborder='0' scrolling='no' width='100%' height='19'></iframe></noscript></div><!-- #head-ad-text -->
</div><!-- #main_header -->

<div id="frame">
<div id="innerframe"><div id="breadcrumbs"><a href="/">SourceForge.JP</a> &gt; <a href="/softwaremap/">ソフトウェアを探す</a> &gt; <b><a href="/projects/gikonavi/">ギコナビ</a></b></div><a name="content"></a><div class="topnav"><h2><a href="/projects/gikonavi/"><img width="32" height="32" src="http://static.sourceforge.jp/thumb/g/0/290/36x36_0.gif" border="0" class="group-logo group-logo-type-icon" alt=""></a>ギコナビ<span id="bookmark_bar"><a title="このページをはてなブックマークに登録" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=3&bookmark_url=http://sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;view=log&bookmark_title=Log of /gikonavi/gikonavi/Gesture.pas - ギコナビ - SourceForge.JP"><span class="bm-icon spimg-bm-hatena"></span></a><a title="このページを Yahoo! ブックマークに登録" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=2&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-yahoo"></span></a><a title="このページをGoogleブックマークに登録" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=5&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-google"></span></a><a title="Retweetする(Twitterにつぶやく)" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=11&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-twitter"></span></a><a title="このページをスラッシュドットにタレこむ" class="bookmark_button" rel="nofollow" href="/my/bookmark_jump.php?id=1&bookmark_url=http%3A%2F%2Fsourceforge.jp%2Fcvs%2Fview%2Fgikonavi%2Fgikonavi%2FGesture.pas%3Fr1%3D1.9%26view%3Dlog&bookmark_title=Log%20of%20%2Fgikonavi%2Fgikonavi%2FGesture.pas%20-%20%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20-%20SourceForge.JP"><span class="bm-icon spimg-bm-slashdotjp"></span></a><a class="igoogle_button" href="http://fusion.google.com/ig/sharetab?source=atgt&atr=%E3%82%AE%E3%82%B3%E3%83%8A%E3%83%93%20on%20SourceForge.jp&n_32=url%3Dhttp%3A%2F%2Fsourceforge.jp%2Fprojects%2Fgikonavi%2Fnews%2Frss%26row%3D1%26sect%3D1&n_32=url%3Dhttp%3A%2F%2Fsourceforge.jp%2Fprojects%2Fgikonavi%2Freleases%2Frss%26row%3D1%26sect%3D2&n_32=url%3Dhttp%3A%2F%2Fsourceforge.jp%2Fprojects%2Fgikonavi%2Fwiki%2F%21feeds%2Fdiff%26row%3D1%26sect%3D3&n_32=url%3Dhttp%3A%2F%2Fsourceforge.jp%2Fprojects%2Fgikonavi%2Fwiki%2F%21feeds%2Flist%26row%3D2%26sect%3D1&n_32=url%3Dhttp%3A%2F%2Fsourceforge.jp%2Fprojects%2Fgikonavi%2Fhistory%2Frss%26row%3D2%26sect%3D2"><img src="http://static.sourceforge.jp/plus_google.gif" alt="このページに関連するRSSをiGoogleウィジットとして登録する" title="このページに関連するRSSをiGoogleウィジットとして登録する" border="0" width="62" height="17"></a></span></h2><div class="firstwave"><ul class="nav"><li class=" first folder folder"><a href="/projects/gikonavi/">概要</a><ul><li><a href="/projects/gikonavi/simple/">プロジェクト概要</a></li><li><a href="/projects/gikonavi/devel">開発ダッシュボード</a></li><li><a href="/projects/gikonavi/reviews/">プロジェクトレビュー</a></li><li><a href="http://gikonavi.sourceforge.jp/">Webページ</a></li><li><a href="/projects/gikonavi/memberlist">開発メンバー</a></li><li><a href="/people/?group_id=713">プロジェクト協力者募集</a></li><li><a href="/projects/gikonavi/feeds/">公開フィード一覧</a></li><li><a href="/projects/gikonavi/stats/">統計情報</a></li><li><a href="/projects/gikonavi/history">プロジェクト履歴</a></li><li><a href="/projects/gikonavi/images">画像ギャラリー</a></li><li><a href="/projects/gikonavi/keywords/">検索キーワード</a></li></ul></li><li class=" folder folder"><a href="/projects/gikonavi/news/">ニュース</a><ul><li><a href="/projects/gikonavi/news/">ニュース一覧</a></li><li><hr></li><li><a href="/docs/%E3%83%98%E3%83%AB%E3%83%97%2F%E3%83%8B%E3%83%A5%E3%83%BC%E3%82%B9">ヘルプ</a></li></ul></li><li class=" folder folder"><a href="/projects/gikonavi/releases/">ダウンロード</a><ul><li><a href="/projects/gikonavi/releases/">リリース一覧</a></li><li><hr></li><li><a href="/docs/%E3%83%98%E3%83%AB%E3%83%97%2F%E3%83%AA%E3%83%AA%E3%83%BC%E3%82%B9">ヘルプ</a></li></ul></li><li class=" selected folder selected folder"><a href="/projects/gikonavi/cvs/">ソースコード</a><ul><li><a href="/projects/gikonavi/cvs/">ガイド</a></li><li class="selected"><a href="/cvs/view/gikonavi/">CVSリポジトリ閲覧</a></li><li><hr></li><li><a href="/docs/%E3%83%98%E3%83%AB%E3%83%97%2F%E3%82%BD%E3%83%BC%E3%82%B9%E3%82%B3%E3%83%BC%E3%83%89">ヘルプ</a></li></ul></li><li class=" folder folder"><a href="http://sourceforge.jp/projects/gikonavi/wiki/">Wiki</a><ul><li><a href="http://sourceforge.jp/projects/gikonavi/wiki/FrontPage">FrontPageの表示</a></li><li><a href="http://sourceforge.jp/projects/gikonavi/wiki/TitleIndex">ページ一覧</a></li><li><a href="http://sourceforge.jp/projects/gikonavi/wiki/RecentChanges">最近の更新</a></li><li><a href="http://sourceforge.jp/projects/gikonavi/wiki/!search">Wiki 検索</a></li><li><hr></li><li><a href="/docs/%E3%83%98%E3%83%AB%E3%83%97%2FWiki">ヘルプ</a></li></ul></li><li class=" folder folder"><a href="/projects/gikonavi/docman/">文書</a><ul><li><a href="/projects/gikonavi/docman/">文書一覧</a></li><li><hr></li><li><a href="/docs/%E3%83%98%E3%83%AB%E3%83%97%2F%E6%96%87%E6%9B%B8">ヘルプ</a></li></ul></li><li class=" folder folder"><a href="/projects/gikonavi/lists/">メーリングリスト</a><ul><li><a href="/projects/gikonavi/lists/">MLの一覧</a></li><li><a href="/docs/%E3%83%98%E3%83%AB%E3%83%97%2F%E3%83%A1%E3%83%BC%E3%83%AA%E3%83%B3%E3%82%B0%E3%83%AA%E3%82%B9%E3%83%88">ヘルプ</a></li></ul></li><li class=" last folder folder"><a href="/projects/gikonavi/ticket/">チケット</a><ul><li><a href="/projects/gikonavi/ticket/">チケット一覧</a></li><li><a href="/ticket/milestonelist.php?group_id=713">マイルストーン一覧</a></li><li><a href="/ticket/types.php?group_id=713">チケットの種類一覧</a></li><li><a href="/ticket/components.php?group_id=713">コンポーネント一覧</a></li><li><a href="/ticket/link_list.php?group_id=713">よく使われるチケット一覧のリスト/RSS</a></li><li><a href="/ticket/newticket.php?group_id=713">新規チケット登録</a></li><li><a href="/docs/%E3%83%98%E3%83%AB%E3%83%97%2F%E3%83%81%E3%82%B1%E3%83%83%E3%83%88">ヘルプ</a></li></ul></li></ul></div><div id="thirdwave"> </div></div>
<!-- START: main_content -->
<table id="main-contents-table" cellspacing="0" border="0">
<tr>
	<!-- START: main_column -->
	<td width="100%" valign="top" align="left" id="main-content">

	<!-- START: site_announce --><!-- *このコメントは消さない* -->
<!-- 内容がない場合は、div ごと全部コメントアウトすること -->
<!--
<div class="site-announce"
  style="padding: 3px; border: thin ridge #9cf;
  background-color: #def;
  margin-bottom: 0.3em; line-height: 1;">
<a href="http://sourceforge.jp/forum/forum.php?forum_id=22574"
  style="color: #000; display: block; font-weight: bold;
  text-decoration: none;font-size:90%;">
サイトメンテナンス 2010/4/5 12:00～14:00(JST) サービスが断続的に停止します
</a>
</div>
-->
<!-- END: site_annouce -->
<h2 class="titlebar">CVS リポジトリの参照</h2>

<div class="vc_navheader">

<form method="get" action="/cvs/view/">

<table style="padding:0.1em;">
<tr>
<td>
<strong>

<a href="/cvs/view/">

[SourceForge]</a>
/

<a href="/cvs/view/gikonavi/">

gikonavi</a>
/

<a href="/cvs/view/gikonavi/gikonavi/">

gikonavi</a>
/



Gesture.pas


</strong>

</td>
<td style="text-align:right;">
&nbsp;
</td>
</tr>
</table>

</form>

</div>
<h2 class="subtitle">Log of /gikonavi/gikonavi/Gesture.pas</h2>

<p style="margin:0;">

<a href="/cvs/view/gikonavi/gikonavi/"><img src="http://static.sourceforge.jp/viewvc/images/back_small.png" width="16" height="16" alt="Parent Directory" /> Parent Directory</a>


| <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=graph"><img src="http://static.sourceforge.jp/viewvc/images/cvsgraph_16x16.png" width="16" height="16" alt="View Revision Graph" /> Revision Graph</a>



</p>

<hr />
<table class="auto">



<tr>
<td>Links to HEAD:</td>
<td>
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=markup">view</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=co">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=co&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=annotate">annotate</a>)
</td>
</tr>



<tr>
<td>Sticky Tag:</td>
<td><form method="get" action="/cvs/view/gikonavi/gikonavi/Gesture.pas" style="display: inline">
<div style="display: inline">
<input type="hidden" name="view" value="log" />


<select name="pathrev" onchange="submit()">
<option value=""></option>

<optgroup label="Branches">


<option>remodeling</option>



<option>bRESPOPUP</option>



<option>bListSU</option>



<option>MAIN</option>



<option>Bdraw</option>



<option>Bb61</option>



<option>Bb60</option>



<option>Bb59</option>



<option>Bb58</option>



<option>Bb57</option>



<option>Bb56</option>



<option>Bb55</option>



<option>Bb54</option>



<option>Bb53</option>



<option>Bb52</option>



<option>Bb51</option>



<option>Bb50</option>


</optgroup>

<optgroup label="Non-branch tags">


<option>v_step1</option>



<option>v1_62_0_804</option>



<option>v1_62_0_803</option>



<option>v1_62_0_802</option>



<option>v1_61_1_801</option>



<option>v1_61_0_800</option>



<option>v1_61_0_799</option>



<option>v1_61_0_798</option>



<option>v1_61_0_797</option>



<option>v1_61_0_796</option>



<option>v1_61_0_795</option>



<option>v1_60_2_794</option>



<option>v1_60_1_793</option>



<option>v1_60_0_793</option>



<option>v1_60_0_792</option>



<option>v1_60_0_791</option>



<option>v1_60_0_790</option>



<option>v1_60_0_789</option>



<option>v1_60_0_788</option>



<option>v1_60_0_787</option>



<option>v1_60_0_786</option>



<option>v1_60_0_784</option>



<option>v1_60_0_783</option>



<option>v1_60_0_782</option>



<option>v1_60_0_781</option>



<option>v1_60_0_780</option>



<option>v1_60_0_779</option>



<option>v1_59_2_785</option>



<option>v1_59_1_778</option>



<option>v1_59_1_765</option>



<option>v1_59_0_778</option>



<option>v1_59_0_777</option>



<option>v1_59_0_776</option>



<option>v1_59_0_775</option>



<option>v1_59_0_774</option>



<option>v1_59_0_773</option>



<option>v1_59_0_772</option>



<option>v1_59_0_771</option>



<option>v1_59_0_770</option>



<option>v1_59_0_769</option>



<option>v1_59_0_768</option>



<option>v1_59_0_767</option>



<option>v1_58_0_763</option>



<option>v1_58_0_762</option>



<option>v1_58_0_761</option>



<option>v1_58_0_760</option>



<option>v1_58_0_759</option>



<option>v1_58_0_757</option>



<option>v1_58_0_756</option>



<option>v1_58_0_755</option>



<option>v1_58_0_754</option>



<option>v1_58_0_752</option>



<option>v1_58_0_751</option>



<option>v1_58_0_750</option>



<option>v1_58_0_748</option>



<option>v1_58_0_747</option>



<option>v1_58_0_746</option>



<option>v1_58_0_745</option>



<option>v1_57_2_749</option>



<option>v1_57_1_744</option>



<option>v1_57_0_744</option>



<option>v1_57_0_743</option>



<option>v1_57_0_742</option>



<option>v1_57_0_741</option>



<option>v1_57_0_740</option>



<option>v1_57_0_739</option>



<option>v1_57_0_738</option>



<option>v1_57_0_737</option>



<option>v1_57_0_736</option>



<option>v1_57_0_735</option>



<option>v1_57_0_734</option>



<option>v1_57_0_733</option>



<option>v1_57_0_732</option>



<option>v1_57_0_731</option>



<option>v1_57_0_730</option>



<option>v1_57_0_729</option>



<option>v1_57_0_728</option>



<option>v1_57_0_727</option>



<option>v1_57_0_726</option>



<option>v1_57_0_725</option>



<option>v1_57_0_723</option>



<option>v1_57_0_722</option>



<option>v1_57_0_720</option>



<option>v1_57_0_719</option>



<option>v1_57_0_718</option>



<option>v1_56_2_724</option>



<option>v1_56_2_722</option>



<option>v1_56_1_717</option>



<option>v1_56_1_716</option>



<option>v1_56_0_721</option>



<option>v1_56_0_716</option>



<option>v1_56_0_715</option>



<option>v1_56_0_714</option>



<option>v1_56_0_713</option>



<option>v1_56_0_712</option>



<option>v1_56_0_711</option>



<option>v1_56_0_710</option>



<option>v1_56_0_709</option>



<option>v1_56_0_708</option>



<option>v1_56_0_707</option>



<option>v1_56_0_706</option>



<option>v1_56_0_705</option>



<option>v1_56_0_704</option>



<option>v1_56_0_703</option>



<option>v1_56_0_702</option>



<option>v1_56_0_701</option>



<option>v1_56_0_700</option>



<option>v1_56_0_699</option>



<option>v1_56_0_698</option>



<option>v1_55_1_697</option>



<option>v1_55_0_697</option>



<option>v1_55_0_696</option>



<option>v1_55_0_695</option>



<option>v1_55_0_694</option>



<option>v1_55_0_693</option>



<option>v1_55_0_692</option>



<option>v1_54_1_691</option>



<option>v1_54_0_690</option>



<option>v1_54_0_689</option>



<option>v1_54_0_688</option>



<option>v1_54_0_687</option>



<option>v1_54_0_686</option>



<option>v1_54_0_685</option>



<option>v1_54_0_684</option>



<option>v1_54_0_683</option>



<option>v1_54_0_682</option>



<option>v1_54_0_681</option>



<option>v1_54_0_680</option>



<option>v1_54_0_679</option>



<option>v1_54_0_678</option>



<option>v1_54_0_677</option>



<option>v1_54_0_676</option>



<option>v1_54_0_675</option>



<option>v1_54_0_674</option>



<option>v1_53_1_673</option>



<option>v1_53_0_672</option>



<option>v1_53_0_671</option>



<option>v1_53_0_670</option>



<option>v1_53_0_669</option>



<option>v1_53_0_668</option>



<option>v1_53_0_667</option>



<option>v1_53_0_666</option>



<option>v1_53_0_665</option>



<option>v1_53_0_664</option>



<option>v1_53_0_663</option>



<option>v1_53_0_662</option>



<option>v1_53_0_661</option>



<option>v1_52_1_658</option>



<option>v1_52_1_657</option>



<option>v1_52_0_660</option>



<option>v1_52_0_656</option>



<option>v1_52_0_655</option>



<option>v1_52_0_654</option>



<option>v1_52_0_652</option>



<option>v1_52_0_651</option>



<option>v1_52_0_650</option>



<option>v1_52_0_649</option>



<option>v1_52_0_648</option>



<option>v1_52_0_647</option>



<option>v1_52_0_646</option>



<option>v1_52_0_645</option>



<option>v1_52_0_644</option>



<option>v1_52_0_643</option>



<option>v1_52_0_642</option>



<option>v1_51_1_641</option>



<option>v1_51_1_640</option>



<option>v1_51_1_639</option>



<option>v1_51_0_638</option>



<option>v1_51_0_637</option>



<option>v1_51_0_636</option>



<option>v1_51_0_635</option>



<option>v1_51_0_634</option>



<option>v1_51_0_633</option>



<option>v1_51_0_632</option>



<option>v1_51_0_631</option>



<option>v1_51_0_630</option>



<option>v1_51_0_629</option>



<option>v1_51_0_628</option>



<option>v1_51_0_627</option>



<option>v1_51_0_626</option>



<option>v1_51_0_625</option>



<option>v1_51_0_624</option>



<option>v1_51_0_623</option>



<option>v1_51_0_622</option>



<option>v1_51_0_621</option>



<option>v1_51_0_620</option>



<option>v1_51_0_619</option>



<option>v1_51_0_618</option>



<option>v1_51_0_617</option>



<option>v1_51_0_616</option>



<option>v1_51_0_615</option>



<option>v1_51_0_614</option>



<option>v1_51_0_613</option>



<option>v1_51_0_612</option>



<option>v1_51_0_611</option>



<option>v1_50_2_606</option>



<option>v1_50_2_604</option>



<option>v1_50_0_606</option>



<option>v1_50_0_605</option>



<option>v1_50_0_604</option>



<option>v1_50_0_603</option>



<option>v1_50_0_602</option>



<option>v1_50_0_601</option>



<option>v1_50_0_600</option>



<option>v1_50_0_599</option>



<option>v1_50_0_598</option>



<option>v1_50_0_596</option>



<option>v1_50_0_595</option>



<option>v1_50_0_594</option>



<option>v1_50_0_593</option>



<option>v1_50_0_590</option>



<option>v1_50_0_588</option>



<option>v1_50_0_587</option>



<option>v1_50_0_586</option>



<option>v1_50_0_585</option>



<option>v1_50_0_584</option>



<option>v1_50_0_582</option>



<option>v1_50_0_581</option>



<option>v1_50_0_580</option>



<option>v1_50_0_579</option>



<option>v1_50_0_578</option>



<option>v1_50_0_577</option>



<option>v1_50_0_576</option>



<option>v1_50_0_574</option>



<option>v1_50_0_573</option>



<option>v1_50_0_572</option>



<option>v1_50_0_571</option>



<option>v1_50_0_561</option>



<option>v1_50_0_557</option>



<option>root-of-remodel</option>



<option>root-of-draw</option>



<option>root-of-Bb53</option>



<option>root-of-Bb51</option>



<option>root-of-Bb50</option>



<option>merged-remodeling</option>



<option>marged_bRESPOPUP</option>



<option>marged-Bb50</option>



<option>bv1_49_0_565</option>



<option>bv1_49_0_564</option>



<option>bv1_49_0_563</option>



<option>b51</option>



<option>b50</option>



<option>HEAD</option>


</optgroup>

</select>

<input type="submit" value="Set" />
</div>
</form>

</td>
</tr>
</table>
 








<div>
<hr />

<a name="rev1.10"></a>
<a name="v1_59_0_771"></a>
<a name="v1_59_0_770"></a>
<a name="v1_59_0_773"></a>
<a name="v1_59_0_772"></a>
<a name="v1_59_0_775"></a>
<a name="v1_59_0_774"></a>
<a name="v1_59_0_777"></a>
<a name="v1_59_0_776"></a>
<a name="v1_59_0_778"></a>
<a name="v1_59_1_765"></a>
<a name="v1_60_0_788"></a>
<a name="v1_60_0_789"></a>
<a name="v1_58_0_748"></a>
<a name="v1_60_0_780"></a>
<a name="v1_60_0_781"></a>
<a name="v1_58_0_747"></a>
<a name="v1_60_0_783"></a>
<a name="v1_60_0_784"></a>
<a name="v1_60_0_786"></a>
<a name="v1_60_0_787"></a>
<a name="v1_59_0_767"></a>
<a name="v1_59_1_778"></a>
<a name="v1_59_0_768"></a>
<a name="v1_59_0_769"></a>
<a name="v1_57_1_744"></a>
<a name="v1_58_0_752"></a>
<a name="v1_58_0_750"></a>
<a name="v1_58_0_751"></a>
<a name="v1_58_0_756"></a>
<a name="v1_58_0_757"></a>
<a name="v1_58_0_754"></a>
<a name="v1_58_0_755"></a>
<a name="v1_58_0_759"></a>
<a name="v1_61_0_796"></a>
<a name="v1_61_0_797"></a>
<a name="v1_61_0_795"></a>
<a name="v1_61_0_798"></a>
<a name="v1_61_0_799"></a>
<a name="v1_62_0_804"></a>
<a name="v1_62_0_803"></a>
<a name="v1_62_0_802"></a>
<a name="v1_58_0_745"></a>
<a name="v1_60_0_779"></a>
<a name="v1_60_0_782"></a>
<a name="v1_58_0_746"></a>
<a name="v1_59_2_785"></a>
<a name="v1_60_1_793"></a>
<a name="v1_58_0_763"></a>
<a name="v1_58_0_762"></a>
<a name="v1_58_0_761"></a>
<a name="v1_58_0_760"></a>
<a name="v1_57_2_749"></a>
<a name="v1_57_0_742"></a>
<a name="v1_57_0_743"></a>
<a name="v1_57_0_740"></a>
<a name="v1_57_0_741"></a>
<a name="v1_57_0_744"></a>
<a name="v1_61_0_800"></a>
<a name="v1_60_0_793"></a>
<a name="v1_60_0_792"></a>
<a name="v1_60_0_791"></a>
<a name="v1_60_0_790"></a>
<a name="v1_60_2_794"></a>
<a name="v1_61_1_801"></a>
<a name="HEAD"></a>


Revision <strong>1.10</strong> -

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.10&amp;view=markup">view</a>)

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.10">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.10&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?annotate=1.10">annotate</a>)



- <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.10&amp;view=log">[select for diffs]</a>




<br />

<em>Mon Feb 11 13:46:13 2008 UTC</em> (2 years, 3 months ago) by <em>h677</em>


<br />Branch:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=MAIN"><strong>MAIN</strong></a>



<br />CVS Tags:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=HEAD"><strong>HEAD</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_740"><strong>v1_57_0_740</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_741"><strong>v1_57_0_741</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_742"><strong>v1_57_0_742</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_743"><strong>v1_57_0_743</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_744"><strong>v1_57_0_744</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_1_744"><strong>v1_57_1_744</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_2_749"><strong>v1_57_2_749</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_745"><strong>v1_58_0_745</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_746"><strong>v1_58_0_746</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_747"><strong>v1_58_0_747</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_748"><strong>v1_58_0_748</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_750"><strong>v1_58_0_750</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_751"><strong>v1_58_0_751</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_752"><strong>v1_58_0_752</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_754"><strong>v1_58_0_754</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_755"><strong>v1_58_0_755</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_756"><strong>v1_58_0_756</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_757"><strong>v1_58_0_757</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_759"><strong>v1_58_0_759</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_760"><strong>v1_58_0_760</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_761"><strong>v1_58_0_761</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_762"><strong>v1_58_0_762</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_58_0_763"><strong>v1_58_0_763</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_767"><strong>v1_59_0_767</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_768"><strong>v1_59_0_768</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_769"><strong>v1_59_0_769</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_770"><strong>v1_59_0_770</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_771"><strong>v1_59_0_771</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_772"><strong>v1_59_0_772</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_773"><strong>v1_59_0_773</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_774"><strong>v1_59_0_774</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_775"><strong>v1_59_0_775</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_776"><strong>v1_59_0_776</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_777"><strong>v1_59_0_777</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_0_778"><strong>v1_59_0_778</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_1_765"><strong>v1_59_1_765</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_1_778"><strong>v1_59_1_778</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_59_2_785"><strong>v1_59_2_785</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_779"><strong>v1_60_0_779</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_780"><strong>v1_60_0_780</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_781"><strong>v1_60_0_781</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_782"><strong>v1_60_0_782</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_783"><strong>v1_60_0_783</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_784"><strong>v1_60_0_784</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_786"><strong>v1_60_0_786</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_787"><strong>v1_60_0_787</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_788"><strong>v1_60_0_788</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_789"><strong>v1_60_0_789</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_790"><strong>v1_60_0_790</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_791"><strong>v1_60_0_791</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_792"><strong>v1_60_0_792</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_0_793"><strong>v1_60_0_793</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_1_793"><strong>v1_60_1_793</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_60_2_794"><strong>v1_60_2_794</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_61_0_795"><strong>v1_61_0_795</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_61_0_796"><strong>v1_61_0_796</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_61_0_797"><strong>v1_61_0_797</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_61_0_798"><strong>v1_61_0_798</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_61_0_799"><strong>v1_61_0_799</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_61_0_800"><strong>v1_61_0_800</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_61_1_801"><strong>v1_61_1_801</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_62_0_802"><strong>v1_62_0_802</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_62_0_803"><strong>v1_62_0_803</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_62_0_804"><strong>v1_62_0_804</strong></a>



<br />Branch point for:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb57"><strong>Bb57</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb58"><strong>Bb58</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb59"><strong>Bb59</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb60"><strong>Bb60</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb61"><strong>Bb61</strong></a>





<br />Changes since <strong>1.9: +1 -1 lines</strong>







<br />Diff to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;r2=1.10">previous 1.9</a>










<pre class="vc_log">Hookの変数が、符号付整数だったので、符号無し整数に変更した。
</pre>
</div>



<div>
<hr />

<a name="rev1.9"></a>
<a name="v1_57_0_723"></a>
<a name="v1_57_0_737"></a>
<a name="v1_57_0_736"></a>
<a name="v1_57_0_735"></a>
<a name="v1_57_0_734"></a>
<a name="v1_57_0_733"></a>
<a name="v1_57_0_732"></a>
<a name="v1_57_0_731"></a>
<a name="v1_57_0_730"></a>
<a name="v1_57_0_739"></a>
<a name="v1_57_0_738"></a>
<a name="v1_56_0_707"></a>
<a name="v1_56_0_705"></a>
<a name="v1_56_0_704"></a>
<a name="v1_56_0_703"></a>
<a name="v1_56_0_702"></a>
<a name="v1_56_0_701"></a>
<a name="v1_56_0_700"></a>
<a name="v1_57_0_725"></a>
<a name="v1_57_0_726"></a>
<a name="v1_57_0_727"></a>
<a name="v1_57_0_720"></a>
<a name="v1_57_0_722"></a>
<a name="v1_57_0_728"></a>
<a name="v1_57_0_729"></a>
<a name="v1_57_0_719"></a>
<a name="v1_57_0_718"></a>
<a name="v1_56_0_716"></a>
<a name="v1_56_0_710"></a>
<a name="v1_56_0_711"></a>
<a name="v1_56_1_717"></a>
<a name="v1_56_1_716"></a>
<a name="v1_54_0_689"></a>
<a name="v1_55_0_692"></a>
<a name="v1_55_0_693"></a>
<a name="v1_55_0_696"></a>
<a name="v1_55_0_697"></a>
<a name="v1_55_0_694"></a>
<a name="v1_55_0_695"></a>
<a name="v1_54_1_691"></a>
<a name="v1_56_2_724"></a>
<a name="v1_56_2_722"></a>
<a name="v1_55_1_697"></a>
<a name="v1_56_0_714"></a>
<a name="v1_56_0_715"></a>
<a name="v1_56_0_712"></a>
<a name="v1_56_0_713"></a>
<a name="v1_56_0_721"></a>
<a name="marged_bRESPOPUP"></a>
<a name="v1_56_0_706"></a>
<a name="v1_54_0_690"></a>
<a name="v1_56_0_709"></a>
<a name="v1_56_0_708"></a>
<a name="v1_56_0_699"></a>
<a name="v1_56_0_698"></a>


Revision <strong>1.9</strong> -

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.9&amp;view=markup">view</a>)

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.9">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.9&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?annotate=1.9">annotate</a>)



- <strong>[selected]</strong>




<br />

<em>Sun Jan 14 13:40:25 2007 UTC</em> (3 years, 4 months ago) by <em>h677</em>


<br />Branch:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=MAIN"><strong>MAIN</strong></a>



<br />CVS Tags:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=marged_bRESPOPUP"><strong>marged_bRESPOPUP</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_689"><strong>v1_54_0_689</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_690"><strong>v1_54_0_690</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_1_691"><strong>v1_54_1_691</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_55_0_692"><strong>v1_55_0_692</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_55_0_693"><strong>v1_55_0_693</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_55_0_694"><strong>v1_55_0_694</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_55_0_695"><strong>v1_55_0_695</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_55_0_696"><strong>v1_55_0_696</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_55_0_697"><strong>v1_55_0_697</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_55_1_697"><strong>v1_55_1_697</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_698"><strong>v1_56_0_698</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_699"><strong>v1_56_0_699</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_700"><strong>v1_56_0_700</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_701"><strong>v1_56_0_701</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_702"><strong>v1_56_0_702</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_703"><strong>v1_56_0_703</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_704"><strong>v1_56_0_704</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_705"><strong>v1_56_0_705</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_706"><strong>v1_56_0_706</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_707"><strong>v1_56_0_707</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_708"><strong>v1_56_0_708</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_709"><strong>v1_56_0_709</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_710"><strong>v1_56_0_710</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_711"><strong>v1_56_0_711</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_712"><strong>v1_56_0_712</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_713"><strong>v1_56_0_713</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_714"><strong>v1_56_0_714</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_715"><strong>v1_56_0_715</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_716"><strong>v1_56_0_716</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_0_721"><strong>v1_56_0_721</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_1_716"><strong>v1_56_1_716</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_1_717"><strong>v1_56_1_717</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_2_722"><strong>v1_56_2_722</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_56_2_724"><strong>v1_56_2_724</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_718"><strong>v1_57_0_718</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_719"><strong>v1_57_0_719</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_720"><strong>v1_57_0_720</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_722"><strong>v1_57_0_722</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_723"><strong>v1_57_0_723</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_725"><strong>v1_57_0_725</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_726"><strong>v1_57_0_726</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_727"><strong>v1_57_0_727</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_728"><strong>v1_57_0_728</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_729"><strong>v1_57_0_729</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_730"><strong>v1_57_0_730</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_731"><strong>v1_57_0_731</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_732"><strong>v1_57_0_732</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_733"><strong>v1_57_0_733</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_734"><strong>v1_57_0_734</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_735"><strong>v1_57_0_735</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_736"><strong>v1_57_0_736</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_737"><strong>v1_57_0_737</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_738"><strong>v1_57_0_738</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_57_0_739"><strong>v1_57_0_739</strong></a>



<br />Branch point for:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb54"><strong>Bb54</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb55"><strong>Bb55</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb56"><strong>Bb56</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=bListSU"><strong>bListSU</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=bRESPOPUP"><strong>bRESPOPUP</strong></a>





<br />Changes since <strong>1.8: +4 -4 lines</strong>







<br />Diff to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.8&amp;r2=1.9">previous 1.8</a>










<pre class="vc_log">レスエディタ,キー設定でマウスジェスチャーの入力がクリアされない不具合の修正
</pre>
</div>



<div>
<hr />

<a name="rev1.8"></a>
<a name="v1_54_0_688"></a>


Revision <strong>1.8</strong> -

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.8&amp;view=markup">view</a>)

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.8">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.8&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?annotate=1.8">annotate</a>)



- <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.8&amp;view=log">[select for diffs]</a>




<br />

<em>Sat Jan  6 13:55:29 2007 UTC</em> (3 years, 5 months ago) by <em>h677</em>


<br />Branch:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=MAIN"><strong>MAIN</strong></a>



<br />CVS Tags:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_688"><strong>v1_54_0_688</strong></a>






<br />Changes since <strong>1.7: +5 -3 lines</strong>







<br />Diff to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.7&amp;r2=1.8">previous 1.7</a>








, 
to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;r2=1.8">selected 1.9</a>





<pre class="vc_log">マウスジェスチャーで、アクションを呼び出すとき前に、
ジェスチャーをクリアするように変更
</pre>
</div>



<div>
<hr />

<a name="rev1.7"></a>
<a name="v1_54_0_687"></a>
<a name="v1_54_0_685"></a>
<a name="v1_54_0_686"></a>


Revision <strong>1.7</strong> -

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.7&amp;view=markup">view</a>)

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.7">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.7&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?annotate=1.7">annotate</a>)



- <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.7&amp;view=log">[select for diffs]</a>




<br />

<em>Sun Dec 24 15:21:09 2006 UTC</em> (3 years, 5 months ago) by <em>h677</em>


<br />Branch:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=MAIN"><strong>MAIN</strong></a>



<br />CVS Tags:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_685"><strong>v1_54_0_685</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_686"><strong>v1_54_0_686</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_687"><strong>v1_54_0_687</strong></a>






<br />Changes since <strong>1.6: +15 -4 lines</strong>







<br />Diff to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.6&amp;r2=1.7">previous 1.6</a>








, 
to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;r2=1.7">selected 1.9</a>





<pre class="vc_log">右クリックのコンテキストメニュー上のマウスジェスチャーを無効にできるオプションを追加。
アドレスバーにフォーカスを当てるショートカットを追加。
</pre>
</div>



<div>
<hr />

<a name="rev1.6"></a>
<a name="v1_53_0_671"></a>
<a name="v1_54_0_677"></a>
<a name="v1_54_0_676"></a>
<a name="v1_54_0_678"></a>
<a name="v1_52_1_658"></a>
<a name="v1_52_0_647"></a>
<a name="v1_54_0_684"></a>
<a name="v1_53_0_664"></a>
<a name="v1_52_0_648"></a>
<a name="v1_53_0_661"></a>
<a name="v1_53_0_663"></a>
<a name="v1_53_0_662"></a>
<a name="v1_53_0_665"></a>
<a name="v1_53_0_667"></a>
<a name="v1_53_0_666"></a>
<a name="v1_53_0_669"></a>
<a name="v1_53_0_668"></a>
<a name="v1_52_0_651"></a>
<a name="v1_52_0_650"></a>
<a name="v1_52_0_652"></a>
<a name="v1_52_0_654"></a>
<a name="v1_53_0_672"></a>
<a name="v1_53_0_670"></a>
<a name="v1_54_0_680"></a>
<a name="v1_54_0_681"></a>
<a name="v1_54_0_682"></a>
<a name="v1_54_0_683"></a>
<a name="v1_54_0_679"></a>
<a name="v1_54_0_675"></a>
<a name="root-of-Bb53"></a>
<a name="v1_52_1_657"></a>
<a name="v1_54_0_674"></a>
<a name="v1_52_0_660"></a>
<a name="v1_52_0_655"></a>
<a name="v1_52_0_656"></a>
<a name="v1_52_0_649"></a>
<a name="v1_53_1_673"></a>


Revision <strong>1.6</strong> -

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.6&amp;view=markup">view</a>)

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.6">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.6&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?annotate=1.6">annotate</a>)



- <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.6&amp;view=log">[select for diffs]</a>




<br />

<em>Wed Feb 22 17:21:22 2006 UTC</em> (4 years, 3 months ago) by <em>h677</em>


<br />Branch:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=MAIN"><strong>MAIN</strong></a>



<br />CVS Tags:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=root-of-Bb53"><strong>root-of-Bb53</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_647"><strong>v1_52_0_647</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_648"><strong>v1_52_0_648</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_649"><strong>v1_52_0_649</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_650"><strong>v1_52_0_650</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_651"><strong>v1_52_0_651</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_652"><strong>v1_52_0_652</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_654"><strong>v1_52_0_654</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_655"><strong>v1_52_0_655</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_656"><strong>v1_52_0_656</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_660"><strong>v1_52_0_660</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_1_657"><strong>v1_52_1_657</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_1_658"><strong>v1_52_1_658</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_661"><strong>v1_53_0_661</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_662"><strong>v1_53_0_662</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_663"><strong>v1_53_0_663</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_664"><strong>v1_53_0_664</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_665"><strong>v1_53_0_665</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_666"><strong>v1_53_0_666</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_667"><strong>v1_53_0_667</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_668"><strong>v1_53_0_668</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_669"><strong>v1_53_0_669</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_670"><strong>v1_53_0_670</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_671"><strong>v1_53_0_671</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_0_672"><strong>v1_53_0_672</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_53_1_673"><strong>v1_53_1_673</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_674"><strong>v1_54_0_674</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_675"><strong>v1_54_0_675</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_676"><strong>v1_54_0_676</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_677"><strong>v1_54_0_677</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_678"><strong>v1_54_0_678</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_679"><strong>v1_54_0_679</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_680"><strong>v1_54_0_680</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_681"><strong>v1_54_0_681</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_682"><strong>v1_54_0_682</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_683"><strong>v1_54_0_683</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_54_0_684"><strong>v1_54_0_684</strong></a>



<br />Branch point for:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb52"><strong>Bb52</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb53"><strong>Bb53</strong></a>





<br />Changes since <strong>1.5: +0 -1 lines</strong>







<br />Diff to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.5&amp;r2=1.6">previous 1.5</a>








, 
to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;r2=1.6">selected 1.9</a>





<pre class="vc_log">dat落ちスレの区別を追加したので、スレッド一覧をそれで絞り込めるようにした
</pre>
</div>



<div>
<hr />

<a name="rev1.5"></a>


Revision <strong>1.5</strong> -

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.5&amp;view=markup">view</a>)

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.5">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.5&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?annotate=1.5">annotate</a>)



- <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.5&amp;view=log">[select for diffs]</a>




<br />

<em>Tue Feb 21 15:35:49 2006 UTC</em> (4 years, 3 months ago) by <em>h677</em>


<br />Branch:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=MAIN"><strong>MAIN</strong></a>







<br />Changes since <strong>1.4: +2 -1 lines</strong>







<br />Diff to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.4&amp;r2=1.5">previous 1.4</a>








, 
to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;r2=1.5">selected 1.9</a>





<pre class="vc_log">マウスジェスチャー-の不具合とレス番指定URLを踏んだときの処理用に
TThreadItemを拡張
</pre>
</div>



<div>
<hr />

<a name="rev1.4"></a>
<a name="v1_51_1_639"></a>
<a name="b51"></a>
<a name="v1_52_0_646"></a>
<a name="v1_52_0_644"></a>
<a name="v1_52_0_643"></a>
<a name="v1_51_0_634"></a>
<a name="v1_51_0_635"></a>
<a name="v1_51_0_636"></a>
<a name="v1_51_0_637"></a>
<a name="v1_51_0_632"></a>
<a name="v1_51_0_633"></a>
<a name="v1_51_0_638"></a>
<a name="v1_52_0_645"></a>
<a name="v1_52_0_642"></a>
<a name="v1_51_1_640"></a>
<a name="v1_51_0_630"></a>
<a name="v1_51_0_631"></a>
<a name="root-of-Bb51"></a>
<a name="v1_51_0_629"></a>
<a name="v1_51_1_641"></a>


Revision <strong>1.4</strong> -

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.4&amp;view=markup">view</a>)

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.4">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.4&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?annotate=1.4">annotate</a>)



- <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.4&amp;view=log">[select for diffs]</a>




<br />

<em>Wed Dec 14 17:04:56 2005 UTC</em> (4 years, 5 months ago) by <em>h677</em>


<br />Branch:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=MAIN"><strong>MAIN</strong></a>



<br />CVS Tags:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=b51"><strong>b51</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=root-of-Bb51"><strong>root-of-Bb51</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_629"><strong>v1_51_0_629</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_630"><strong>v1_51_0_630</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_631"><strong>v1_51_0_631</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_632"><strong>v1_51_0_632</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_633"><strong>v1_51_0_633</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_634"><strong>v1_51_0_634</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_635"><strong>v1_51_0_635</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_636"><strong>v1_51_0_636</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_637"><strong>v1_51_0_637</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_638"><strong>v1_51_0_638</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_1_639"><strong>v1_51_1_639</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_1_640"><strong>v1_51_1_640</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_1_641"><strong>v1_51_1_641</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_642"><strong>v1_52_0_642</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_643"><strong>v1_52_0_643</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_644"><strong>v1_52_0_644</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_645"><strong>v1_52_0_645</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_52_0_646"><strong>v1_52_0_646</strong></a>



<br />Branch point for:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb51"><strong>Bb51</strong></a>





<br />Changes since <strong>1.3: +23 -11 lines</strong>







<br />Diff to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.3&amp;r2=1.4">previous 1.3</a>








, 
to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;r2=1.4">selected 1.9</a>





<pre class="vc_log">1.3の直し方だと、メインSフォームのポップアップがおかしくなるので、１.2相当に
ロールバック。
</pre>
</div>



<div>
<hr />

<a name="rev1.3"></a>


Revision <strong>1.3</strong> -

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.3&amp;view=markup">view</a>)

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.3">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.3&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?annotate=1.3">annotate</a>)



- <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.3&amp;view=log">[select for diffs]</a>




<br />

<em>Wed Dec 14 15:14:42 2005 UTC</em> (4 years, 5 months ago) by <em>h677</em>


<br />Branch:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=MAIN"><strong>MAIN</strong></a>







<br />Changes since <strong>1.2: +11 -27 lines</strong>







<br />Diff to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.2&amp;r2=1.3">previous 1.2</a>








, 
to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;r2=1.3">selected 1.9</a>





<pre class="vc_log">マウスジェスチャー有効時に画像プレビュー上で右クリックが
効かない不具合の修正。
</pre>
</div>



<div>
<hr />

<a name="rev1.2"></a>
<a name="v1_51_0_612"></a>
<a name="marged-Bb50"></a>
<a name="v1_51_0_626"></a>
<a name="v1_51_0_625"></a>
<a name="v1_51_0_622"></a>
<a name="v1_51_0_611"></a>
<a name="v1_51_0_620"></a>
<a name="v1_51_0_616"></a>
<a name="v1_51_0_614"></a>
<a name="v1_51_0_615"></a>
<a name="v1_51_0_613"></a>
<a name="v1_51_0_618"></a>
<a name="v1_51_0_619"></a>
<a name="root-of-draw"></a>
<a name="v1_51_0_628"></a>
<a name="v1_51_0_617"></a>
<a name="v1_51_0_627"></a>
<a name="v1_51_0_623"></a>
<a name="v1_51_0_624"></a>
<a name="v1_51_0_621"></a>


Revision <strong>1.2</strong> -

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.2&amp;view=markup">view</a>)

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.2">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.2&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?annotate=1.2">annotate</a>)



- <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.2&amp;view=log">[select for diffs]</a>




<br />

<em>Mon Jul 18 03:55:14 2005 UTC</em> (4 years, 10 months ago) by <em>h677</em>


<br />Branch:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=MAIN"><strong>MAIN</strong></a>



<br />CVS Tags:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=marged-Bb50"><strong>marged-Bb50</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=root-of-draw"><strong>root-of-draw</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_611"><strong>v1_51_0_611</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_612"><strong>v1_51_0_612</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_613"><strong>v1_51_0_613</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_614"><strong>v1_51_0_614</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_615"><strong>v1_51_0_615</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_616"><strong>v1_51_0_616</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_617"><strong>v1_51_0_617</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_618"><strong>v1_51_0_618</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_619"><strong>v1_51_0_619</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_620"><strong>v1_51_0_620</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_621"><strong>v1_51_0_621</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_622"><strong>v1_51_0_622</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_623"><strong>v1_51_0_623</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_624"><strong>v1_51_0_624</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_625"><strong>v1_51_0_625</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_626"><strong>v1_51_0_626</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_627"><strong>v1_51_0_627</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_51_0_628"><strong>v1_51_0_628</strong></a>



<br />Branch point for:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bdraw"><strong>Bdraw</strong></a>





<br />Changes since <strong>1.1: +14 -3 lines</strong>







<br />Diff to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.1&amp;r2=1.2">previous 1.1</a>








, 
to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;r2=1.2">selected 1.9</a>





<pre class="vc_log">ハ゛タ50（1.50.1.599)までの変更分をマージ
</pre>
</div>



<div>
<hr />

<a name="rev1.1.4.1"></a>
<a name="v1_50_2_606"></a>
<a name="v1_50_0_595"></a>
<a name="v1_50_0_598"></a>
<a name="v1_50_0_596"></a>
<a name="v1_50_0_603"></a>
<a name="v1_50_0_604"></a>
<a name="v1_50_0_606"></a>
<a name="b50"></a>
<a name="v1_50_0_600"></a>
<a name="v1_50_0_602"></a>
<a name="v1_50_0_601"></a>
<a name="v1_50_2_604"></a>
<a name="v1_50_0_605"></a>
<a name="v1_50_0_599"></a>

<a name="Bb50"></a>

Revision <strong>1.1.4.1</strong> -

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.1.4.1&amp;view=markup">view</a>)

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.1.4.1">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.1.4.1&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?annotate=1.1.4.1">annotate</a>)



- <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.1.4.1&amp;view=log">[select for diffs]</a>




<br />

<em>Sat Jul  9 05:28:35 2005 UTC</em> (4 years, 11 months ago) by <em>h677</em>


<br />Branch:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb50"><strong>Bb50</strong></a>



<br />CVS Tags:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=b50"><strong>b50</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_595"><strong>v1_50_0_595</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_596"><strong>v1_50_0_596</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_598"><strong>v1_50_0_598</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_599"><strong>v1_50_0_599</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_600"><strong>v1_50_0_600</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_601"><strong>v1_50_0_601</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_602"><strong>v1_50_0_602</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_603"><strong>v1_50_0_603</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_604"><strong>v1_50_0_604</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_605"><strong>v1_50_0_605</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_606"><strong>v1_50_0_606</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_2_604"><strong>v1_50_2_604</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_2_606"><strong>v1_50_2_606</strong></a>






<br />Changes since <strong>1.1: +14 -3 lines</strong>







<br />Diff to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.1&amp;r2=1.1.4.1">previous 1.1</a>






, to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.10&amp;r2=1.1.4.1">next main 1.10</a>





, 
to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;r2=1.1.4.1">selected 1.9</a>





<pre class="vc_log">マウスジェスチャーのコンテキスト上とかでの動作の修正
</pre>
</div>



<div>
<hr />

<a name="rev1.1"></a>
<a name="v1_50_0_581"></a>
<a name="v1_50_0_580"></a>
<a name="v1_50_0_587"></a>
<a name="v1_50_0_586"></a>
<a name="v1_50_0_572"></a>
<a name="v1_50_0_590"></a>
<a name="bv1_49_0_564"></a>
<a name="v1_50_0_593"></a>
<a name="v1_50_0_557"></a>
<a name="v1_50_0_585"></a>
<a name="v1_50_0_582"></a>
<a name="merged-remodeling"></a>
<a name="v1_50_0_577"></a>
<a name="v1_50_0_588"></a>
<a name="bv1_49_0_565"></a>
<a name="v1_50_0_574"></a>
<a name="v1_50_0_584"></a>
<a name="v_step1"></a>
<a name="v1_50_0_573"></a>
<a name="v1_50_0_571"></a>
<a name="v1_50_0_576"></a>
<a name="v1_50_0_578"></a>
<a name="v1_50_0_579"></a>
<a name="root-of-Bb50"></a>
<a name="root-of-remodel"></a>
<a name="v1_50_0_594"></a>
<a name="bv1_49_0_563"></a>
<a name="v1_50_0_561"></a>


Revision <strong>1.1</strong> -

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.1&amp;view=markup">view</a>)

(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.1">download</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?revision=1.1&amp;content-type=text%2Fplain">as text</a>)
(<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?annotate=1.1">annotate</a>)



- <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.1&amp;view=log">[select for diffs]</a>




<br />

<em>Mon Oct 11 14:38:58 2004 UTC</em> (5 years, 8 months ago) by <em>yoffy</em>


<br />Branch:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=MAIN"><strong>MAIN</strong></a>



<br />CVS Tags:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=bv1_49_0_563"><strong>bv1_49_0_563</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=bv1_49_0_564"><strong>bv1_49_0_564</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=bv1_49_0_565"><strong>bv1_49_0_565</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=merged-remodeling"><strong>merged-remodeling</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=root-of-Bb50"><strong>root-of-Bb50</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=root-of-remodel"><strong>root-of-remodel</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_557"><strong>v1_50_0_557</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_561"><strong>v1_50_0_561</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_571"><strong>v1_50_0_571</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_572"><strong>v1_50_0_572</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_573"><strong>v1_50_0_573</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_574"><strong>v1_50_0_574</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_576"><strong>v1_50_0_576</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_577"><strong>v1_50_0_577</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_578"><strong>v1_50_0_578</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_579"><strong>v1_50_0_579</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_580"><strong>v1_50_0_580</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_581"><strong>v1_50_0_581</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_582"><strong>v1_50_0_582</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_584"><strong>v1_50_0_584</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_585"><strong>v1_50_0_585</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_586"><strong>v1_50_0_586</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_587"><strong>v1_50_0_587</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_588"><strong>v1_50_0_588</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_590"><strong>v1_50_0_590</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_593"><strong>v1_50_0_593</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v1_50_0_594"><strong>v1_50_0_594</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=v_step1"><strong>v_step1</strong></a>



<br />Branch point for:

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=Bb50"><strong>Bb50</strong></a>,

<a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?view=log&amp;pathrev=remodeling"><strong>remodeling</strong></a>












<br />Diff
to <a href="/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&amp;r2=1.1">selected 1.9</a>





<pre class="vc_log">マウスジェスチャの追加。
build557
</pre>
</div>

 



 <hr />
<p><a name="diff"></a>
This form allows you to request diffs between any two revisions of this file.
For each of the two "sides" of the diff,

select a symbolic revision name using the selection box, or choose
'Use Text Field' and enter a numeric revision.

</p>
<form method="get" action="/cvs/view/gikonavi/gikonavi/Gesture.pas" id="diff_select">
<table cellpadding="2" cellspacing="0" class="auto">
<tr>
<td>&nbsp;</td>
<td>
<input type="hidden" name="view" value="diff" />
Diffs between

<select name="r1">
<option value="text" selected="selected">Use Text Field</option>

<option value="1.1:v_step1">v_step1</option>

<option value="1.10:v1_62_0_804">v1_62_0_804</option>

<option value="1.10:v1_62_0_803">v1_62_0_803</option>

<option value="1.10:v1_62_0_802">v1_62_0_802</option>

<option value="1.10:v1_61_1_801">v1_61_1_801</option>

<option value="1.10:v1_61_0_800">v1_61_0_800</option>

<option value="1.10:v1_61_0_799">v1_61_0_799</option>

<option value="1.10:v1_61_0_798">v1_61_0_798</option>

<option value="1.10:v1_61_0_797">v1_61_0_797</option>

<option value="1.10:v1_61_0_796">v1_61_0_796</option>

<option value="1.10:v1_61_0_795">v1_61_0_795</option>

<option value="1.10:v1_60_2_794">v1_60_2_794</option>

<option value="1.10:v1_60_1_793">v1_60_1_793</option>

<option value="1.10:v1_60_0_793">v1_60_0_793</option>

<option value="1.10:v1_60_0_792">v1_60_0_792</option>

<option value="1.10:v1_60_0_791">v1_60_0_791</option>

<option value="1.10:v1_60_0_790">v1_60_0_790</option>

<option value="1.10:v1_60_0_789">v1_60_0_789</option>

<option value="1.10:v1_60_0_788">v1_60_0_788</option>

<option value="1.10:v1_60_0_787">v1_60_0_787</option>

<option value="1.10:v1_60_0_786">v1_60_0_786</option>

<option value="1.10:v1_60_0_784">v1_60_0_784</option>

<option value="1.10:v1_60_0_783">v1_60_0_783</option>

<option value="1.10:v1_60_0_782">v1_60_0_782</option>

<option value="1.10:v1_60_0_781">v1_60_0_781</option>

<option value="1.10:v1_60_0_780">v1_60_0_780</option>

<option value="1.10:v1_60_0_779">v1_60_0_779</option>

<option value="1.10:v1_59_2_785">v1_59_2_785</option>

<option value="1.10:v1_59_1_778">v1_59_1_778</option>

<option value="1.10:v1_59_1_765">v1_59_1_765</option>

<option value="1.10:v1_59_0_778">v1_59_0_778</option>

<option value="1.10:v1_59_0_777">v1_59_0_777</option>

<option value="1.10:v1_59_0_776">v1_59_0_776</option>

<option value="1.10:v1_59_0_775">v1_59_0_775</option>

<option value="1.10:v1_59_0_774">v1_59_0_774</option>

<option value="1.10:v1_59_0_773">v1_59_0_773</option>

<option value="1.10:v1_59_0_772">v1_59_0_772</option>

<option value="1.10:v1_59_0_771">v1_59_0_771</option>

<option value="1.10:v1_59_0_770">v1_59_0_770</option>

<option value="1.10:v1_59_0_769">v1_59_0_769</option>

<option value="1.10:v1_59_0_768">v1_59_0_768</option>

<option value="1.10:v1_59_0_767">v1_59_0_767</option>

<option value="1.10:v1_58_0_763">v1_58_0_763</option>

<option value="1.10:v1_58_0_762">v1_58_0_762</option>

<option value="1.10:v1_58_0_761">v1_58_0_761</option>

<option value="1.10:v1_58_0_760">v1_58_0_760</option>

<option value="1.10:v1_58_0_759">v1_58_0_759</option>

<option value="1.10:v1_58_0_757">v1_58_0_757</option>

<option value="1.10:v1_58_0_756">v1_58_0_756</option>

<option value="1.10:v1_58_0_755">v1_58_0_755</option>

<option value="1.10:v1_58_0_754">v1_58_0_754</option>

<option value="1.10:v1_58_0_752">v1_58_0_752</option>

<option value="1.10:v1_58_0_751">v1_58_0_751</option>

<option value="1.10:v1_58_0_750">v1_58_0_750</option>

<option value="1.10:v1_58_0_748">v1_58_0_748</option>

<option value="1.10:v1_58_0_747">v1_58_0_747</option>

<option value="1.10:v1_58_0_746">v1_58_0_746</option>

<option value="1.10:v1_58_0_745">v1_58_0_745</option>

<option value="1.10:v1_57_2_749">v1_57_2_749</option>

<option value="1.10:v1_57_1_744">v1_57_1_744</option>

<option value="1.10:v1_57_0_744">v1_57_0_744</option>

<option value="1.10:v1_57_0_743">v1_57_0_743</option>

<option value="1.10:v1_57_0_742">v1_57_0_742</option>

<option value="1.10:v1_57_0_741">v1_57_0_741</option>

<option value="1.10:v1_57_0_740">v1_57_0_740</option>

<option value="1.9:v1_57_0_739">v1_57_0_739</option>

<option value="1.9:v1_57_0_738">v1_57_0_738</option>

<option value="1.9:v1_57_0_737">v1_57_0_737</option>

<option value="1.9:v1_57_0_736">v1_57_0_736</option>

<option value="1.9:v1_57_0_735">v1_57_0_735</option>

<option value="1.9:v1_57_0_734">v1_57_0_734</option>

<option value="1.9:v1_57_0_733">v1_57_0_733</option>

<option value="1.9:v1_57_0_732">v1_57_0_732</option>

<option value="1.9:v1_57_0_731">v1_57_0_731</option>

<option value="1.9:v1_57_0_730">v1_57_0_730</option>

<option value="1.9:v1_57_0_729">v1_57_0_729</option>

<option value="1.9:v1_57_0_728">v1_57_0_728</option>

<option value="1.9:v1_57_0_727">v1_57_0_727</option>

<option value="1.9:v1_57_0_726">v1_57_0_726</option>

<option value="1.9:v1_57_0_725">v1_57_0_725</option>

<option value="1.9:v1_57_0_723">v1_57_0_723</option>

<option value="1.9:v1_57_0_722">v1_57_0_722</option>

<option value="1.9:v1_57_0_720">v1_57_0_720</option>

<option value="1.9:v1_57_0_719">v1_57_0_719</option>

<option value="1.9:v1_57_0_718">v1_57_0_718</option>

<option value="1.9:v1_56_2_724">v1_56_2_724</option>

<option value="1.9:v1_56_2_722">v1_56_2_722</option>

<option value="1.9:v1_56_1_717">v1_56_1_717</option>

<option value="1.9:v1_56_1_716">v1_56_1_716</option>

<option value="1.9:v1_56_0_721">v1_56_0_721</option>

<option value="1.9:v1_56_0_716">v1_56_0_716</option>

<option value="1.9:v1_56_0_715">v1_56_0_715</option>

<option value="1.9:v1_56_0_714">v1_56_0_714</option>

<option value="1.9:v1_56_0_713">v1_56_0_713</option>

<option value="1.9:v1_56_0_712">v1_56_0_712</option>

<option value="1.9:v1_56_0_711">v1_56_0_711</option>

<option value="1.9:v1_56_0_710">v1_56_0_710</option>

<option value="1.9:v1_56_0_709">v1_56_0_709</option>

<option value="1.9:v1_56_0_708">v1_56_0_708</option>

<option value="1.9:v1_56_0_707">v1_56_0_707</option>

<option value="1.9:v1_56_0_706">v1_56_0_706</option>

<option value="1.9:v1_56_0_705">v1_56_0_705</option>

<option value="1.9:v1_56_0_704">v1_56_0_704</option>

<option value="1.9:v1_56_0_703">v1_56_0_703</option>

<option value="1.9:v1_56_0_702">v1_56_0_702</option>

<option value="1.9:v1_56_0_701">v1_56_0_701</option>

<option value="1.9:v1_56_0_700">v1_56_0_700</option>

<option value="1.9:v1_56_0_699">v1_56_0_699</option>

<option value="1.9:v1_56_0_698">v1_56_0_698</option>

<option value="1.9:v1_55_1_697">v1_55_1_697</option>

<option value="1.9:v1_55_0_697">v1_55_0_697</option>

<option value="1.9:v1_55_0_696">v1_55_0_696</option>

<option value="1.9:v1_55_0_695">v1_55_0_695</option>

<option value="1.9:v1_55_0_694">v1_55_0_694</option>

<option value="1.9:v1_55_0_693">v1_55_0_693</option>

<option value="1.9:v1_55_0_692">v1_55_0_692</option>

<option value="1.9:v1_54_1_691">v1_54_1_691</option>

<option value="1.9:v1_54_0_690">v1_54_0_690</option>

<option value="1.9:v1_54_0_689">v1_54_0_689</option>

<option value="1.8:v1_54_0_688">v1_54_0_688</option>

<option value="1.7:v1_54_0_687">v1_54_0_687</option>

<option value="1.7:v1_54_0_686">v1_54_0_686</option>

<option value="1.7:v1_54_0_685">v1_54_0_685</option>

<option value="1.6:v1_54_0_684">v1_54_0_684</option>

<option value="1.6:v1_54_0_683">v1_54_0_683</option>

<option value="1.6:v1_54_0_682">v1_54_0_682</option>

<option value="1.6:v1_54_0_681">v1_54_0_681</option>

<option value="1.6:v1_54_0_680">v1_54_0_680</option>

<option value="1.6:v1_54_0_679">v1_54_0_679</option>

<option value="1.6:v1_54_0_678">v1_54_0_678</option>

<option value="1.6:v1_54_0_677">v1_54_0_677</option>

<option value="1.6:v1_54_0_676">v1_54_0_676</option>

<option value="1.6:v1_54_0_675">v1_54_0_675</option>

<option value="1.6:v1_54_0_674">v1_54_0_674</option>

<option value="1.6:v1_53_1_673">v1_53_1_673</option>

<option value="1.6:v1_53_0_672">v1_53_0_672</option>

<option value="1.6:v1_53_0_671">v1_53_0_671</option>

<option value="1.6:v1_53_0_670">v1_53_0_670</option>

<option value="1.6:v1_53_0_669">v1_53_0_669</option>

<option value="1.6:v1_53_0_668">v1_53_0_668</option>

<option value="1.6:v1_53_0_667">v1_53_0_667</option>

<option value="1.6:v1_53_0_666">v1_53_0_666</option>

<option value="1.6:v1_53_0_665">v1_53_0_665</option>

<option value="1.6:v1_53_0_664">v1_53_0_664</option>

<option value="1.6:v1_53_0_663">v1_53_0_663</option>

<option value="1.6:v1_53_0_662">v1_53_0_662</option>

<option value="1.6:v1_53_0_661">v1_53_0_661</option>

<option value="1.6:v1_52_1_658">v1_52_1_658</option>

<option value="1.6:v1_52_1_657">v1_52_1_657</option>

<option value="1.6:v1_52_0_660">v1_52_0_660</option>

<option value="1.6:v1_52_0_656">v1_52_0_656</option>

<option value="1.6:v1_52_0_655">v1_52_0_655</option>

<option value="1.6:v1_52_0_654">v1_52_0_654</option>

<option value="1.6:v1_52_0_652">v1_52_0_652</option>

<option value="1.6:v1_52_0_651">v1_52_0_651</option>

<option value="1.6:v1_52_0_650">v1_52_0_650</option>

<option value="1.6:v1_52_0_649">v1_52_0_649</option>

<option value="1.6:v1_52_0_648">v1_52_0_648</option>

<option value="1.6:v1_52_0_647">v1_52_0_647</option>

<option value="1.4:v1_52_0_646">v1_52_0_646</option>

<option value="1.4:v1_52_0_645">v1_52_0_645</option>

<option value="1.4:v1_52_0_644">v1_52_0_644</option>

<option value="1.4:v1_52_0_643">v1_52_0_643</option>

<option value="1.4:v1_52_0_642">v1_52_0_642</option>

<option value="1.4:v1_51_1_641">v1_51_1_641</option>

<option value="1.4:v1_51_1_640">v1_51_1_640</option>

<option value="1.4:v1_51_1_639">v1_51_1_639</option>

<option value="1.4:v1_51_0_638">v1_51_0_638</option>

<option value="1.4:v1_51_0_637">v1_51_0_637</option>

<option value="1.4:v1_51_0_636">v1_51_0_636</option>

<option value="1.4:v1_51_0_635">v1_51_0_635</option>

<option value="1.4:v1_51_0_634">v1_51_0_634</option>

<option value="1.4:v1_51_0_633">v1_51_0_633</option>

<option value="1.4:v1_51_0_632">v1_51_0_632</option>

<option value="1.4:v1_51_0_631">v1_51_0_631</option>

<option value="1.4:v1_51_0_630">v1_51_0_630</option>

<option value="1.4:v1_51_0_629">v1_51_0_629</option>

<option value="1.2:v1_51_0_628">v1_51_0_628</option>

<option value="1.2:v1_51_0_627">v1_51_0_627</option>

<option value="1.2:v1_51_0_626">v1_51_0_626</option>

<option value="1.2:v1_51_0_625">v1_51_0_625</option>

<option value="1.2:v1_51_0_624">v1_51_0_624</option>

<option value="1.2:v1_51_0_623">v1_51_0_623</option>

<option value="1.2:v1_51_0_622">v1_51_0_622</option>

<option value="1.2:v1_51_0_621">v1_51_0_621</option>

<option value="1.2:v1_51_0_620">v1_51_0_620</option>

<option value="1.2:v1_51_0_619">v1_51_0_619</option>

<option value="1.2:v1_51_0_618">v1_51_0_618</option>

<option value="1.2:v1_51_0_617">v1_51_0_617</option>

<option value="1.2:v1_51_0_616">v1_51_0_616</option>

<option value="1.2:v1_51_0_615">v1_51_0_615</option>

<option value="1.2:v1_51_0_614">v1_51_0_614</option>

<option value="1.2:v1_51_0_613">v1_51_0_613</option>

<option value="1.2:v1_51_0_612">v1_51_0_612</option>

<option value="1.2:v1_51_0_611">v1_51_0_611</option>

<option value="1.1.4.1:v1_50_2_606">v1_50_2_606</option>

<option value="1.1.4.1:v1_50_2_604">v1_50_2_604</option>

<option value="1.1.4.1:v1_50_0_606">v1_50_0_606</option>

<option value="1.1.4.1:v1_50_0_605">v1_50_0_605</option>

<option value="1.1.4.1:v1_50_0_604">v1_50_0_604</option>

<option value="1.1.4.1:v1_50_0_603">v1_50_0_603</option>

<option value="1.1.4.1:v1_50_0_602">v1_50_0_602</option>

<option value="1.1.4.1:v1_50_0_601">v1_50_0_601</option>

<option value="1.1.4.1:v1_50_0_600">v1_50_0_600</option>

<option value="1.1.4.1:v1_50_0_599">v1_50_0_599</option>

<option value="1.1.4.1:v1_50_0_598">v1_50_0_598</option>

<option value="1.1.4.1:v1_50_0_596">v1_50_0_596</option>

<option value="1.1.4.1:v1_50_0_595">v1_50_0_595</option>

<option value="1.1:v1_50_0_594">v1_50_0_594</option>

<option value="1.1:v1_50_0_593">v1_50_0_593</option>

<option value="1.1:v1_50_0_590">v1_50_0_590</option>

<option value="1.1:v1_50_0_588">v1_50_0_588</option>

<option value="1.1:v1_50_0_587">v1_50_0_587</option>

<option value="1.1:v1_50_0_586">v1_50_0_586</option>

<option value="1.1:v1_50_0_585">v1_50_0_585</option>

<option value="1.1:v1_50_0_584">v1_50_0_584</option>

<option value="1.1:v1_50_0_582">v1_50_0_582</option>

<option value="1.1:v1_50_0_581">v1_50_0_581</option>

<option value="1.1:v1_50_0_580">v1_50_0_580</option>

<option value="1.1:v1_50_0_579">v1_50_0_579</option>

<option value="1.1:v1_50_0_578">v1_50_0_578</option>

<option value="1.1:v1_50_0_577">v1_50_0_577</option>

<option value="1.1:v1_50_0_576">v1_50_0_576</option>

<option value="1.1:v1_50_0_574">v1_50_0_574</option>

<option value="1.1:v1_50_0_573">v1_50_0_573</option>

<option value="1.1:v1_50_0_572">v1_50_0_572</option>

<option value="1.1:v1_50_0_571">v1_50_0_571</option>

<option value="1.1:v1_50_0_561">v1_50_0_561</option>

<option value="1.1:v1_50_0_557">v1_50_0_557</option>

<option value="1.1:root-of-remodel">root-of-remodel</option>

<option value="1.2:root-of-draw">root-of-draw</option>

<option value="1.6:root-of-Bb53">root-of-Bb53</option>

<option value="1.4:root-of-Bb51">root-of-Bb51</option>

<option value="1.1:root-of-Bb50">root-of-Bb50</option>

<option value="1.1:remodeling">remodeling</option>

<option value="1.1:merged-remodeling">merged-remodeling</option>

<option value="1.9:marged_bRESPOPUP">marged_bRESPOPUP</option>

<option value="1.2:marged-Bb50">marged-Bb50</option>

<option value="1.1:bv1_49_0_565">bv1_49_0_565</option>

<option value="1.1:bv1_49_0_564">bv1_49_0_564</option>

<option value="1.1:bv1_49_0_563">bv1_49_0_563</option>

<option value="1.9:bRESPOPUP">bRESPOPUP</option>

<option value="1.9:bListSU">bListSU</option>

<option value="1.4:b51">b51</option>

<option value="1.1.4.1:b50">b50</option>

<option value="1.10:MAIN">MAIN</option>

<option value="1.10:HEAD">HEAD</option>

<option value="1.2:Bdraw">Bdraw</option>

<option value="1.10:Bb61">Bb61</option>

<option value="1.10:Bb60">Bb60</option>

<option value="1.10:Bb59">Bb59</option>

<option value="1.10:Bb58">Bb58</option>

<option value="1.10:Bb57">Bb57</option>

<option value="1.9:Bb56">Bb56</option>

<option value="1.9:Bb55">Bb55</option>

<option value="1.9:Bb54">Bb54</option>

<option value="1.6:Bb53">Bb53</option>

<option value="1.6:Bb52">Bb52</option>

<option value="1.4:Bb51">Bb51</option>

<option value="1.1.4.1:Bb50">Bb50</option>

</select>
<input type="text" size="12" name="tr1"
value="1.9"
onchange="document.getElementById('diff_select').r1.selectedIndex=0" />

and

<select name="r2">
<option value="text" selected="selected">Use Text Field</option>

<option value="1.1:v_step1">v_step1</option>

<option value="1.10:v1_62_0_804">v1_62_0_804</option>

<option value="1.10:v1_62_0_803">v1_62_0_803</option>

<option value="1.10:v1_62_0_802">v1_62_0_802</option>

<option value="1.10:v1_61_1_801">v1_61_1_801</option>

<option value="1.10:v1_61_0_800">v1_61_0_800</option>

<option value="1.10:v1_61_0_799">v1_61_0_799</option>

<option value="1.10:v1_61_0_798">v1_61_0_798</option>

<option value="1.10:v1_61_0_797">v1_61_0_797</option>

<option value="1.10:v1_61_0_796">v1_61_0_796</option>

<option value="1.10:v1_61_0_795">v1_61_0_795</option>

<option value="1.10:v1_60_2_794">v1_60_2_794</option>

<option value="1.10:v1_60_1_793">v1_60_1_793</option>

<option value="1.10:v1_60_0_793">v1_60_0_793</option>

<option value="1.10:v1_60_0_792">v1_60_0_792</option>

<option value="1.10:v1_60_0_791">v1_60_0_791</option>

<option value="1.10:v1_60_0_790">v1_60_0_790</option>

<option value="1.10:v1_60_0_789">v1_60_0_789</option>

<option value="1.10:v1_60_0_788">v1_60_0_788</option>

<option value="1.10:v1_60_0_787">v1_60_0_787</option>

<option value="1.10:v1_60_0_786">v1_60_0_786</option>

<option value="1.10:v1_60_0_784">v1_60_0_784</option>

<option value="1.10:v1_60_0_783">v1_60_0_783</option>

<option value="1.10:v1_60_0_782">v1_60_0_782</option>

<option value="1.10:v1_60_0_781">v1_60_0_781</option>

<option value="1.10:v1_60_0_780">v1_60_0_780</option>

<option value="1.10:v1_60_0_779">v1_60_0_779</option>

<option value="1.10:v1_59_2_785">v1_59_2_785</option>

<option value="1.10:v1_59_1_778">v1_59_1_778</option>

<option value="1.10:v1_59_1_765">v1_59_1_765</option>

<option value="1.10:v1_59_0_778">v1_59_0_778</option>

<option value="1.10:v1_59_0_777">v1_59_0_777</option>

<option value="1.10:v1_59_0_776">v1_59_0_776</option>

<option value="1.10:v1_59_0_775">v1_59_0_775</option>

<option value="1.10:v1_59_0_774">v1_59_0_774</option>

<option value="1.10:v1_59_0_773">v1_59_0_773</option>

<option value="1.10:v1_59_0_772">v1_59_0_772</option>

<option value="1.10:v1_59_0_771">v1_59_0_771</option>

<option value="1.10:v1_59_0_770">v1_59_0_770</option>

<option value="1.10:v1_59_0_769">v1_59_0_769</option>

<option value="1.10:v1_59_0_768">v1_59_0_768</option>

<option value="1.10:v1_59_0_767">v1_59_0_767</option>

<option value="1.10:v1_58_0_763">v1_58_0_763</option>

<option value="1.10:v1_58_0_762">v1_58_0_762</option>

<option value="1.10:v1_58_0_761">v1_58_0_761</option>

<option value="1.10:v1_58_0_760">v1_58_0_760</option>

<option value="1.10:v1_58_0_759">v1_58_0_759</option>

<option value="1.10:v1_58_0_757">v1_58_0_757</option>

<option value="1.10:v1_58_0_756">v1_58_0_756</option>

<option value="1.10:v1_58_0_755">v1_58_0_755</option>

<option value="1.10:v1_58_0_754">v1_58_0_754</option>

<option value="1.10:v1_58_0_752">v1_58_0_752</option>

<option value="1.10:v1_58_0_751">v1_58_0_751</option>

<option value="1.10:v1_58_0_750">v1_58_0_750</option>

<option value="1.10:v1_58_0_748">v1_58_0_748</option>

<option value="1.10:v1_58_0_747">v1_58_0_747</option>

<option value="1.10:v1_58_0_746">v1_58_0_746</option>

<option value="1.10:v1_58_0_745">v1_58_0_745</option>

<option value="1.10:v1_57_2_749">v1_57_2_749</option>

<option value="1.10:v1_57_1_744">v1_57_1_744</option>

<option value="1.10:v1_57_0_744">v1_57_0_744</option>

<option value="1.10:v1_57_0_743">v1_57_0_743</option>

<option value="1.10:v1_57_0_742">v1_57_0_742</option>

<option value="1.10:v1_57_0_741">v1_57_0_741</option>

<option value="1.10:v1_57_0_740">v1_57_0_740</option>

<option value="1.9:v1_57_0_739">v1_57_0_739</option>

<option value="1.9:v1_57_0_738">v1_57_0_738</option>

<option value="1.9:v1_57_0_737">v1_57_0_737</option>

<option value="1.9:v1_57_0_736">v1_57_0_736</option>

<option value="1.9:v1_57_0_735">v1_57_0_735</option>

<option value="1.9:v1_57_0_734">v1_57_0_734</option>

<option value="1.9:v1_57_0_733">v1_57_0_733</option>

<option value="1.9:v1_57_0_732">v1_57_0_732</option>

<option value="1.9:v1_57_0_731">v1_57_0_731</option>

<option value="1.9:v1_57_0_730">v1_57_0_730</option>

<option value="1.9:v1_57_0_729">v1_57_0_729</option>

<option value="1.9:v1_57_0_728">v1_57_0_728</option>

<option value="1.9:v1_57_0_727">v1_57_0_727</option>

<option value="1.9:v1_57_0_726">v1_57_0_726</option>

<option value="1.9:v1_57_0_725">v1_57_0_725</option>

<option value="1.9:v1_57_0_723">v1_57_0_723</option>

<option value="1.9:v1_57_0_722">v1_57_0_722</option>

<option value="1.9:v1_57_0_720">v1_57_0_720</option>

<option value="1.9:v1_57_0_719">v1_57_0_719</option>

<option value="1.9:v1_57_0_718">v1_57_0_718</option>

<option value="1.9:v1_56_2_724">v1_56_2_724</option>

<option value="1.9:v1_56_2_722">v1_56_2_722</option>

<option value="1.9:v1_56_1_717">v1_56_1_717</option>

<option value="1.9:v1_56_1_716">v1_56_1_716</option>

<option value="1.9:v1_56_0_721">v1_56_0_721</option>

<option value="1.9:v1_56_0_716">v1_56_0_716</option>

<option value="1.9:v1_56_0_715">v1_56_0_715</option>

<option value="1.9:v1_56_0_714">v1_56_0_714</option>

<option value="1.9:v1_56_0_713">v1_56_0_713</option>

<option value="1.9:v1_56_0_712">v1_56_0_712</option>

<option value="1.9:v1_56_0_711">v1_56_0_711</option>

<option value="1.9:v1_56_0_710">v1_56_0_710</option>

<option value="1.9:v1_56_0_709">v1_56_0_709</option>

<option value="1.9:v1_56_0_708">v1_56_0_708</option>

<option value="1.9:v1_56_0_707">v1_56_0_707</option>

<option value="1.9:v1_56_0_706">v1_56_0_706</option>

<option value="1.9:v1_56_0_705">v1_56_0_705</option>

<option value="1.9:v1_56_0_704">v1_56_0_704</option>

<option value="1.9:v1_56_0_703">v1_56_0_703</option>

<option value="1.9:v1_56_0_702">v1_56_0_702</option>

<option value="1.9:v1_56_0_701">v1_56_0_701</option>

<option value="1.9:v1_56_0_700">v1_56_0_700</option>

<option value="1.9:v1_56_0_699">v1_56_0_699</option>

<option value="1.9:v1_56_0_698">v1_56_0_698</option>

<option value="1.9:v1_55_1_697">v1_55_1_697</option>

<option value="1.9:v1_55_0_697">v1_55_0_697</option>

<option value="1.9:v1_55_0_696">v1_55_0_696</option>

<option value="1.9:v1_55_0_695">v1_55_0_695</option>

<option value="1.9:v1_55_0_694">v1_55_0_694</option>

<option value="1.9:v1_55_0_693">v1_55_0_693</option>

<option value="1.9:v1_55_0_692">v1_55_0_692</option>

<option value="1.9:v1_54_1_691">v1_54_1_691</option>

<option value="1.9:v1_54_0_690">v1_54_0_690</option>

<option value="1.9:v1_54_0_689">v1_54_0_689</option>

<option value="1.8:v1_54_0_688">v1_54_0_688</option>

<option value="1.7:v1_54_0_687">v1_54_0_687</option>

<option value="1.7:v1_54_0_686">v1_54_0_686</option>

<option value="1.7:v1_54_0_685">v1_54_0_685</option>

<option value="1.6:v1_54_0_684">v1_54_0_684</option>

<option value="1.6:v1_54_0_683">v1_54_0_683</option>

<option value="1.6:v1_54_0_682">v1_54_0_682</option>

<option value="1.6:v1_54_0_681">v1_54_0_681</option>

<option value="1.6:v1_54_0_680">v1_54_0_680</option>

<option value="1.6:v1_54_0_679">v1_54_0_679</option>

<option value="1.6:v1_54_0_678">v1_54_0_678</option>

<option value="1.6:v1_54_0_677">v1_54_0_677</option>

<option value="1.6:v1_54_0_676">v1_54_0_676</option>

<option value="1.6:v1_54_0_675">v1_54_0_675</option>

<option value="1.6:v1_54_0_674">v1_54_0_674</option>

<option value="1.6:v1_53_1_673">v1_53_1_673</option>

<option value="1.6:v1_53_0_672">v1_53_0_672</option>

<option value="1.6:v1_53_0_671">v1_53_0_671</option>

<option value="1.6:v1_53_0_670">v1_53_0_670</option>

<option value="1.6:v1_53_0_669">v1_53_0_669</option>

<option value="1.6:v1_53_0_668">v1_53_0_668</option>

<option value="1.6:v1_53_0_667">v1_53_0_667</option>

<option value="1.6:v1_53_0_666">v1_53_0_666</option>

<option value="1.6:v1_53_0_665">v1_53_0_665</option>

<option value="1.6:v1_53_0_664">v1_53_0_664</option>

<option value="1.6:v1_53_0_663">v1_53_0_663</option>

<option value="1.6:v1_53_0_662">v1_53_0_662</option>

<option value="1.6:v1_53_0_661">v1_53_0_661</option>

<option value="1.6:v1_52_1_658">v1_52_1_658</option>

<option value="1.6:v1_52_1_657">v1_52_1_657</option>

<option value="1.6:v1_52_0_660">v1_52_0_660</option>

<option value="1.6:v1_52_0_656">v1_52_0_656</option>

<option value="1.6:v1_52_0_655">v1_52_0_655</option>

<option value="1.6:v1_52_0_654">v1_52_0_654</option>

<option value="1.6:v1_52_0_652">v1_52_0_652</option>

<option value="1.6:v1_52_0_651">v1_52_0_651</option>

<option value="1.6:v1_52_0_650">v1_52_0_650</option>

<option value="1.6:v1_52_0_649">v1_52_0_649</option>

<option value="1.6:v1_52_0_648">v1_52_0_648</option>

<option value="1.6:v1_52_0_647">v1_52_0_647</option>

<option value="1.4:v1_52_0_646">v1_52_0_646</option>

<option value="1.4:v1_52_0_645">v1_52_0_645</option>

<option value="1.4:v1_52_0_644">v1_52_0_644</option>

<option value="1.4:v1_52_0_643">v1_52_0_643</option>

<option value="1.4:v1_52_0_642">v1_52_0_642</option>

<option value="1.4:v1_51_1_641">v1_51_1_641</option>

<option value="1.4:v1_51_1_640">v1_51_1_640</option>

<option value="1.4:v1_51_1_639">v1_51_1_639</option>

<option value="1.4:v1_51_0_638">v1_51_0_638</option>

<option value="1.4:v1_51_0_637">v1_51_0_637</option>

<option value="1.4:v1_51_0_636">v1_51_0_636</option>

<option value="1.4:v1_51_0_635">v1_51_0_635</option>

<option value="1.4:v1_51_0_634">v1_51_0_634</option>

<option value="1.4:v1_51_0_633">v1_51_0_633</option>

<option value="1.4:v1_51_0_632">v1_51_0_632</option>

<option value="1.4:v1_51_0_631">v1_51_0_631</option>

<option value="1.4:v1_51_0_630">v1_51_0_630</option>

<option value="1.4:v1_51_0_629">v1_51_0_629</option>

<option value="1.2:v1_51_0_628">v1_51_0_628</option>

<option value="1.2:v1_51_0_627">v1_51_0_627</option>

<option value="1.2:v1_51_0_626">v1_51_0_626</option>

<option value="1.2:v1_51_0_625">v1_51_0_625</option>

<option value="1.2:v1_51_0_624">v1_51_0_624</option>

<option value="1.2:v1_51_0_623">v1_51_0_623</option>

<option value="1.2:v1_51_0_622">v1_51_0_622</option>

<option value="1.2:v1_51_0_621">v1_51_0_621</option>

<option value="1.2:v1_51_0_620">v1_51_0_620</option>

<option value="1.2:v1_51_0_619">v1_51_0_619</option>

<option value="1.2:v1_51_0_618">v1_51_0_618</option>

<option value="1.2:v1_51_0_617">v1_51_0_617</option>

<option value="1.2:v1_51_0_616">v1_51_0_616</option>

<option value="1.2:v1_51_0_615">v1_51_0_615</option>

<option value="1.2:v1_51_0_614">v1_51_0_614</option>

<option value="1.2:v1_51_0_613">v1_51_0_613</option>

<option value="1.2:v1_51_0_612">v1_51_0_612</option>

<option value="1.2:v1_51_0_611">v1_51_0_611</option>

<option value="1.1.4.1:v1_50_2_606">v1_50_2_606</option>

<option value="1.1.4.1:v1_50_2_604">v1_50_2_604</option>

<option value="1.1.4.1:v1_50_0_606">v1_50_0_606</option>

<option value="1.1.4.1:v1_50_0_605">v1_50_0_605</option>

<option value="1.1.4.1:v1_50_0_604">v1_50_0_604</option>

<option value="1.1.4.1:v1_50_0_603">v1_50_0_603</option>

<option value="1.1.4.1:v1_50_0_602">v1_50_0_602</option>

<option value="1.1.4.1:v1_50_0_601">v1_50_0_601</option>

<option value="1.1.4.1:v1_50_0_600">v1_50_0_600</option>

<option value="1.1.4.1:v1_50_0_599">v1_50_0_599</option>

<option value="1.1.4.1:v1_50_0_598">v1_50_0_598</option>

<option value="1.1.4.1:v1_50_0_596">v1_50_0_596</option>

<option value="1.1.4.1:v1_50_0_595">v1_50_0_595</option>

<option value="1.1:v1_50_0_594">v1_50_0_594</option>

<option value="1.1:v1_50_0_593">v1_50_0_593</option>

<option value="1.1:v1_50_0_590">v1_50_0_590</option>

<option value="1.1:v1_50_0_588">v1_50_0_588</option>

<option value="1.1:v1_50_0_587">v1_50_0_587</option>

<option value="1.1:v1_50_0_586">v1_50_0_586</option>

<option value="1.1:v1_50_0_585">v1_50_0_585</option>

<option value="1.1:v1_50_0_584">v1_50_0_584</option>

<option value="1.1:v1_50_0_582">v1_50_0_582</option>

<option value="1.1:v1_50_0_581">v1_50_0_581</option>

<option value="1.1:v1_50_0_580">v1_50_0_580</option>

<option value="1.1:v1_50_0_579">v1_50_0_579</option>

<option value="1.1:v1_50_0_578">v1_50_0_578</option>

<option value="1.1:v1_50_0_577">v1_50_0_577</option>

<option value="1.1:v1_50_0_576">v1_50_0_576</option>

<option value="1.1:v1_50_0_574">v1_50_0_574</option>

<option value="1.1:v1_50_0_573">v1_50_0_573</option>

<option value="1.1:v1_50_0_572">v1_50_0_572</option>

<option value="1.1:v1_50_0_571">v1_50_0_571</option>

<option value="1.1:v1_50_0_561">v1_50_0_561</option>

<option value="1.1:v1_50_0_557">v1_50_0_557</option>

<option value="1.1:root-of-remodel">root-of-remodel</option>

<option value="1.2:root-of-draw">root-of-draw</option>

<option value="1.6:root-of-Bb53">root-of-Bb53</option>

<option value="1.4:root-of-Bb51">root-of-Bb51</option>

<option value="1.1:root-of-Bb50">root-of-Bb50</option>

<option value="1.1:remodeling">remodeling</option>

<option value="1.1:merged-remodeling">merged-remodeling</option>

<option value="1.9:marged_bRESPOPUP">marged_bRESPOPUP</option>

<option value="1.2:marged-Bb50">marged-Bb50</option>

<option value="1.1:bv1_49_0_565">bv1_49_0_565</option>

<option value="1.1:bv1_49_0_564">bv1_49_0_564</option>

<option value="1.1:bv1_49_0_563">bv1_49_0_563</option>

<option value="1.9:bRESPOPUP">bRESPOPUP</option>

<option value="1.9:bListSU">bListSU</option>

<option value="1.4:b51">b51</option>

<option value="1.1.4.1:b50">b50</option>

<option value="1.10:MAIN">MAIN</option>

<option value="1.10:HEAD">HEAD</option>

<option value="1.2:Bdraw">Bdraw</option>

<option value="1.10:Bb61">Bb61</option>

<option value="1.10:Bb60">Bb60</option>

<option value="1.10:Bb59">Bb59</option>

<option value="1.10:Bb58">Bb58</option>

<option value="1.10:Bb57">Bb57</option>

<option value="1.9:Bb56">Bb56</option>

<option value="1.9:Bb55">Bb55</option>

<option value="1.9:Bb54">Bb54</option>

<option value="1.6:Bb53">Bb53</option>

<option value="1.6:Bb52">Bb52</option>

<option value="1.4:Bb51">Bb51</option>

<option value="1.1.4.1:Bb50">Bb50</option>

</select>
<input type="text" size="12" name="tr2"
value="1.1"
onchange="document.getElementById('diff_select').r2.selectedIndex=0" />

</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>
Type of Diff should be a
<select name="diff_format" onchange="submit()">
<option value="h" selected="selected">Colored Diff</option>
<option value="l" >Long Colored Diff</option>
<option value="u" >Unidiff</option>
<option value="c" >Context Diff</option>
<option value="s" >Side by Side</option>
</select>
<input type="submit" value=" Get Diffs " />
</td>
</tr>
</table>
</form>


<form method="get" action="/cvs/view/gikonavi/gikonavi/Gesture.pas">
<div>
<hr />
<a name="logsort"></a>
<input type="hidden" name="view" value="log" />
Sort log by:
<select name="logsort" onchange="submit()">
<option value="cvs" >Not sorted</option>
<option value="date" selected="selected">Commit date</option>
<option value="rev" >Revision</option>
</select>
<input type="submit" value=" Sort " />
</div>
</form>


<hr />
<table>
<tr valign="top">
<td align="left">

<a href="http://sourceforge.jp/">Back to SourceForge.jp</a> <br />
<style type="text/css">
#adsense-foot a { text-decoration: none; }
padding: 1em 0;
</style>
<div id="adsense-foot">




</div>
</td>
<td style="text-align: right;">
&nbsp;
<a href="http://sourceforge.jp/"><img src="http://images.sourceforge.jp/sfjplogo-125-white.png" alt="SourceForge.jp" border=0 width=125 height=39></a>
<img src="http://static.sourceforge.jp/viewvc/images/logo.png" alt="(Powered by ViewVC)" border="0" width="128" height="48" /><br />
Powered by <a href="http://viewvc.org/">ViewVC 1.0.5</a> <br />
<a href="http://static.sourceforge.jp/viewvc/help_log.html">ViewVC Help</a>
</td>
</tr>
</table>

<script type="text/javascript">sfjpAdSense.config('plain');google_language = 'ja';google_afs_hl = 'ja';google_ad_channel = '9592289707';sfjpAdSense.set_skip();</script><script language="JavaScript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
			<noscript>
			<img height=1 width=1 border=0 src="http://pagead2.googlesyndication.com/pagead/imp.gif?client=pub-9941151214016196&event=noscript" />
			</noscript>
</td><td   id="sidebar-column" valign="top" width="300"><img src="http://static.sourceforge.jp/blank.gif" border="0" alt="" width="300" height="1"><div class="ad300">
<div>
<script type='text/javascript'><!--// <![CDATA[
OA_show(34);
// ]]> --></script>
<noscript><iframe id='a3f834d4' name='a3f834d4' src='http://ads.osdn.jp/x/delivery/afr.php?zoneid=42&amp;cb=1mmsn98p' frameborder='0' scrolling='no' width='300' height='250'></iframe></noscript>
</div>

<div>
<script type='text/javascript'><!--// <![CDATA[
    OA_show(72);
// ]]> --></script>
<noscript><a target='_blank' href='http://ads.osdn.jp/x/delivery/ck.php?n=ed3dadb'><img border='0' alt='' src='http://ads.osdn.jp/x/delivery/avw.php?zoneid=72&amp;n=ed3dadb' /></a></noscript>
</div>
</div>


<TABLE  cellpadding="2" cellspacing="0" border="0" border_color="#000000" border_width="2" border_type="simple" width="100%">
  <TR bgcolor><TH colspan="3" align="left" class="download-top-title"><FONT class="small" color="#000000"><h3 class="titlebar"><a href="/export/rss_topprojects.php?type=downloads"><img src="http://static.sourceforge.jp/ic/feed-14x14.png" alt="[RSS]" align="right" border="0" width="14" height="14"></a><a href="/top/overview.php">オープンソース・ダウンロード</a></h3></FONT></TH></TR>
<TBODY  class="download-top-body">
  <TR>
    <TD class="small" valign="top">1&nbsp;</TD>
    <TD class="small" valign="top">(9,688)</TD>
    <TD class="small" valign="top"><A href="/projects/cabos/">Cabos</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">2&nbsp;</TD>
    <TD class="small" valign="top">(2,357)</TD>
    <TD class="small" valign="top"><A href="/projects/sevenzip/">7-Zip</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">3&nbsp;</TD>
    <TD class="small" valign="top">(1,730)</TD>
    <TD class="small" valign="top"><A href="/projects/handbrake-jp/">HandBrake日本語版</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">4&nbsp;</TD>
    <TD class="small" valign="top">(1,708)</TD>
    <TD class="small" valign="top"><A href="/projects/crystaldiskinfo/">CrystalDiskInfo</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">5&nbsp;</TD>
    <TD class="small" valign="top">(1,670)</TD>
    <TD class="small" valign="top"><A href="/projects/ttssh2/">Tera Term</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">6&nbsp;</TD>
    <TD class="small" valign="top">(1,091)</TD>
    <TD class="small" valign="top"><A href="/projects/crystaldiskmark/">CrystalDiskMark</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">7&nbsp;</TD>
    <TD class="small" valign="top">(893)</TD>
    <TD class="small" valign="top"><A href="/projects/ffdshow-tryout/">ffdshow</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">8&nbsp;</TD>
    <TD class="small" valign="top">(782)</TD>
    <TD class="small" valign="top"><A href="/projects/tween/">Tween</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">9&nbsp;</TD>
    <TD class="small" valign="top">(608)</TD>
    <TD class="small" valign="top"><A href="/projects/gikonavi/">ギコナビ</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">10&nbsp;</TD>
    <TD class="small" valign="top">(530)</TD>
    <TD class="small" valign="top"><A href="/projects/mergedoc/">MergeDoc</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">11&nbsp;</TD>
    <TD class="small" valign="top">(479)</TD>
    <TD class="small" valign="top"><A href="/projects/amateras/">Amateras</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">12&nbsp;</TD>
    <TD class="small" valign="top">(470)</TD>
    <TD class="small" valign="top"><A href="/projects/virtualdubmod/">VirtualDubMod-jp</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">13&nbsp;</TD>
    <TD class="small" valign="top">(361)</TD>
    <TD class="small" valign="top"><A href="/projects/smplayer/">SMPlayer</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">14&nbsp;</TD>
    <TD class="small" valign="top">(338)</TD>
    <TD class="small" valign="top"><A href="/projects/nttdatagroup-oss-square/">nttdatagroup-oss-square</A><BR>
</TD>
  </TR>
  <TR>
    <TD class="small" valign="top">15&nbsp;</TD>
    <TD class="small" valign="top">(326)</TD>
    <TD class="small" valign="top"><A href="/projects/ecodecotool/">えこでこツール</A><BR>
</TD>
  </TR>
  <TR>
    <TD align="right" colspan="3"><a href="/top/topdl.php?type=downloads_day">もっと見る&nbsp;&gt;&gt;</a></TD>
  </TR>
</TBODY>
</TABLE>

<div id="magazine-index"><h3 class="titlebar"><a href="http://sourceforge.jp/magazine/rss"><span class="spimg-rss spclass-float-right-nontxet" title="RSS Feed">[RSS]</span></a><a href="http://sourceforge.jp/magazine/">新着Magazine記事</a></h3><div class="block-contents"><div class="article-entry"><span class="spimg-document spclass-float-left-nontext"></span><h4><a href="http://sourceforge.jp/magazine/10/06/11/107227">ピュアJavaデータベースHSQLDBの最新版「HyperSQL 2.0」が公開</a></h4><div class="article-entry-date">2010-06-11 19:05</div></div><div class="article-entry"><span class="spimg-document spclass-float-left-nontext"></span><h4><a href="http://sourceforge.jp/magazine/10/06/11/0232254">LLVM Project、次世代デバッガ「LLDB」を開発へ</a></h4><div class="article-entry-date">2010-06-11 11:31</div></div><div class="article-entry"><span class="spimg-document spclass-float-left-nontext"></span><h4><a href="http://sourceforge.jp/magazine/10/06/10/1019257">さまざまなWebブラウザに対応、振り分け機能など豊富な機能を持つダウンローダ「Free Download Manager」</a></h4><div class="article-entry-date">2010-06-10 20:00</div></div><div class="article-entry"><span class="spimg-document spclass-float-left-nontext"></span><h4><a href="http://sourceforge.jp/magazine/10/06/10/0445242">米CTERA、Ext3互換で高度なスナップショット機能を持つファイルシステム「Next3」を公開</a></h4><div class="article-entry-date">2010-06-10 13:40</div></div><div class="article-entry"><span class="spimg-document spclass-float-left-nontext"></span><h4><a href="http://sourceforge.jp/magazine/10/06/10/0440210">米Ingres、「既存のデータベースより10倍～70倍高速」というデータ解析向けDBMS「VectorWise」をリリース</a></h4><div class="article-entry-date">2010-06-10 13:37</div></div><div class="more"><a href="http://sourceforge.jp/magazine/">もっと見る</a>&gt;&gt;</div></div></div><div class="ad300">
<script type='text/javascript'><!--// <![CDATA[
OA_show(45);
// ]]> --></script>
<noscript>
<iframe id='a0a64889' name='a0a64889' src='http://ads.osdn.jp/x/delivery/afr.php?zoneid=47&amp;cb=1mmsn98q' frameborder='0' scrolling='no' width='300' height='250'></iframe>
</noscript>
</div>
</TD>
</tr></table>

</div></div>

<!-- START: page_foot -->
<div id="osdnsitefooter">
<div class="cols">
<div class="col first">
<span>サイト情報</span>
<ul><li><a href="/news/?group_id=1">サイトアナウンス</a></li><li><a href="/docs/SourceForge.JP%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6">SourceForge.JPについて</a></li><li><a href="http://osdn.jp/about.shtml">OSDNについて</a></li><li><a rel="nofollow" href="http://osdn.jp/privacy.shtml">プライバシー</a></li><li><a rel="nofollow" href="http://osdn.jp/pp.shtml">個人情報保護方針</a></li></ul>
</div>
<div class="col">
<span>ソフトウェアを探す</span>
<ul><li><a href="/search/">検索</a></li><li><a href="/softwaremap/">カテゴリで探す</a></li><li><a href="/top/topdl.php?type=downloads_day">ダウンロードランキング</a></li><li><a href="/top/overview.php">プロジェクトランキング</a></li></ul>
</div>
<div class="col">
<span>ソフトウェアを作る</span>
<ul><li><a href="/develop/">プロジェクト登録</a></li><li><a href="/people/">プロジェクト協力者募集</a></li><li><a href="/recent-approved.php">新規登録プロジェクト</a></li></ul>
</div>
<div class="col">
<span>コミュニティ</span>
<ul><li><a href="http://twitter.com/sourceforgejp">@sourceforgejp on Twitter</a></li><li><a href="http://twitter.com/sfjp_magazine">@sfjp_magazine on Twitter</a></li><li><a href="http://friendfeed.com/sourceforgejp">SF.JP on FriendFeed</a></li><li><a href="http://slashdot.jp/">スラッシュドット</a></li><li><a href="http://freshmeat.jp/">freshmeat</a></li></ul>
</div>
<div class="col">
<span>ヘルプ</span>
<ul><li><a rel="nofollow" href="/tos.php">利用規約</a></li><li><a href="/docs/FrontPage">ヘルプ</a></li><li><a rel="nofollow" href="/docs/SourceForge.JP%E3%81%AE%E9%80%A3%E7%B5%A1%E5%85%88">連絡先</a></li><li><a href="http://osdn.jp/advertise/">広告掲載</a></li></ul>
</div>
<div class="spacer"></div>
</div>
<div id="copyright">
Copyright &copy;<a href="http://osdn.co.jp/">OSDN Corporation</a>
</div>

</div><!-- #osdnsitefooter -->
<!-- END: page_foot -->
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-739864-3");
pageTracker._trackPageview();
} catch(err) {}</script><script src="http://img.ak.impact-ad.jp/imd/bta_both.js"></script></body></html>